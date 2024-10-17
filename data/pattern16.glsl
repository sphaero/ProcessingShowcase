// Medialab Creative Technology - Sjoerd Schoenmakers
// ChatGPT heeft de hash, noise en fbm functie geschreven voor de terrain vorm
// licht berekening, modellen en kleuren van https://www.youtube.com/watch?v=Cfe5UQ-1L9Q&list=WL&index=2
// sdf functies van https://iquilezles.org/articles/distfunctions/



uniform vec4 iMouse;
uniform vec2 iResolution;
uniform float iTime;


//--------------------------------------------------------------------
// terrain
//--------------------------------------------------------------------

// hash function for noise generation
float hash(float n) {
    return fract(sin(n) * 43758.5453);
}

// 2D noise function using a grid of pseudo-random values
float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    float a = hash(i.x + hash(i.y) * 57.0);
    float b = hash(i.x + 1.0 + hash(i.y) * 57.0);
    float c = hash(i.x + hash(i.y + 1.0) * 57.0);
    float d = hash(i.x + 1.0 + hash(i.y + 1.0) * 57.0);
    
    vec2 u = f * f * (3.0 - 2.0 * f); // smoothstep
    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
}

float fbm(vec2 p) {
    float f = 1.0;
    float a = 0.5;
    float h = 0.0;
    
    for (int i = 0; i < 5; i++) // 5 octaves
    {
        h += a * noise(p * f);
        f *= 2.0; // increase frequency
        a *= 0.5; // decrease amplitude
    }
    return h;
}

float terrain(vec3 p)
{
    float height = fbm(p.xz * 0.5);
    return p.y - height;
}


//--------------------------------------------------------------------
// flag
//--------------------------------------------------------------------

float sdElipsoid(vec3 p, vec3 rad)
{
    float k0 = length(p/rad);
    float k1 = length(p/rad/rad);
    return k0*(k0-1.0)/k1;
}

float sdCylinder(vec3 p, float h, float r)
{
  vec2 d = abs(vec2(length(p.xz),p.y)) - vec2(r,h);
  return min(max(d.x,d.y),0.0) + length(max(d,0.0));
}

float sdBox( vec3 p, vec3 b, float r )
{
  vec3 q = abs(p) - b + r;
  return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0) - r;
}

vec2 sdFlag(vec3 p)
{
    vec3 polePos = vec3(1.0, 0.75, 1.0);
    float pole = sdCylinder(p - polePos, 0.35, 0.01);
    
    vec3 ballPos = polePos + vec3(0.0, 0.35, 0.0);
    vec3 ballSize = vec3(0.02, 0.012, 0.02);
    float ball = sdElipsoid(p - ballPos, ballSize);

    float d = min(pole, ball);
    vec2 res = vec2(d, 2.0);
    
    vec3 flagPos = polePos + vec3(0.0, 0.23, -0.18);
    float flag = sdBox(p - flagPos, vec3(0.002, 0.1, 0.18), 0.02);
    
    if(flag<d)
    {
        res = vec2(flag, 3.0);
    }
    
    return res;
}


//--------------------------------------------------------------------
// lighting
//--------------------------------------------------------------------

vec2 map(vec3 p)
{
    vec2 d1 = sdFlag(p);
    
    float d2 = terrain(p);
    
    return (d2 < d1.x) ? vec2(d2, 1.0) : d1;
}

vec3 calcNormal(vec3 p)
{
    vec2 e = vec2(0.0001, 0.0);
    return normalize(vec3( map(p + e.xyy).x - map(p - e.xyy).x, 
                               map(p + e.yxy).x - map(p - e.yxy).x, 
                               map(p + e.yyx).x - map(p - e.yyx).x  ));
}

float castShadow(in vec3 ro, vec3 rd)
{
    float res = 1.0;
    
    float t = 0.001;
    for(int i = 0; i<100; i++)
    {
        vec3 p = ro + rd * t;
        float h =  map(p).x;
        res = min(res, 16.0*h/t);
        if(res<0.0001) break;
        t += h;
        if(t>20.0) break;
    }
    
    return clamp(res, 0.0, 1.0);
}

vec2 castRay(vec3 ro, vec3 rd)
{
    float m = -1.0;
    float t = 0.0;
    for(int i = 0; i < 100; i++)
    {
        vec3 p = ro + rd * t;
        vec2 d = map(p);
        m = d.y;
        if(d.x < 0.001) break;
        t += d.x * 0.4;
        if(t > 20.0) break;
    }
    if(t > 20.0) m = -1.0;
    return vec2(t, m);
}


//--------------------------------------------------------------------
// main
//--------------------------------------------------------------------

void main()
{
    vec2 p = (gl_FragCoord.xy * 2.0 - iResolution.xy) / iResolution.y;
    
    //camera
        //static
        vec3 ta = vec3(0.0, 1.16, 0.0);
        vec3 ro = vec3(1.85, 0.7, 0.78);
        
        ////interactive rotation, comment out 'rotating'
        //float an = 10.0 * iMouse.x / iResolution.x;
        //ta = vec3(0.0, 0.5, 0.0);
        //float dCamTa = 2.5;
        //ro = ta + vec3(dCamTa * sin(an), 0.2, dCamTa * cos(an));
        
        //rotating
        float an = 500.0 * iTime / iResolution.x;
        ta = vec3(2.0, 0.5, 1.0);
        float dCamTa = 2.5;
        ro = ta + vec3(dCamTa * sin(an), 0.2, dCamTa * cos(an));
    
    vec3 ww = normalize(ta - ro);
    vec3 uu = normalize(cross(ww, vec3(0.0, 1.0, 0.0)));
    vec3 vv = normalize(cross(uu, ww));
    
    float fov = 1.8;
    vec3 rd = vec3(p.x * uu + p.y * vv + fov * ww);
    
    //background colour
    vec3 col = vec3(0.4, 0.7, 1.0) - 0.4 * rd.y;
    col = mix(col, vec3(0.6, 0.9, 1.0), exp(-10.0 * rd.y));
    
    //raymarching
    vec2 tm = castRay(ro, rd);
    if(tm.y > 0.0)
    {
        float t = tm.x;
        
        vec3 p = ro + rd * t;
        vec3 nor = calcNormal(p);
        
        vec3 mate = vec3(0.2);
        if(tm.y < 1.5)
        {
            mate = vec3(0.05 + 0.05 * (1.0 - p.y), 0.05 + 0.1 * p.y, 0.02);
            mate += 0.5 * vec3(0.02 * tm.x, 0.03 * tm.x, 0.04 * tm.x);
        }
        else if(tm.y < 2.5)
        {
            mate = vec3(0.2, 0.1, 0.02) * p.y * p.y;
        }
        else //if(tm.y < 3.5) flag colours
        {
            mate = vec3(0.8, 0.8, 0.8); //Dutch
            if(p.y > 1.008)
            {
                mate = vec3(0.5, 0.08, 0.08);
            }
            if(p.y < 0.95)
            {
                mate = vec3(0.06, 0.07, 0.4);
            }
            
            float flashPeriod = 1.0;
            float flashDuration = 0.48;
            float flash = mod(iTime, flashPeriod);
            if (flash < flashDuration) //German
            {
                mate = vec3(0.5, 0.08, 0.08);
                if(p.y > 1.008)
                {
                    mate = vec3(0.01, 0.01, 0.01);
                }
                if(p.y < 0.95)
                {
                    mate = vec3(0.5, 0.5, 0.06);
                }
            } 
        }
        
        vec3 sun_dir = vec3(0.8, 0.4, 0.2);
        float sun_dif = clamp(dot(nor, sun_dir), 0.0, 1.0);
        float sun_sha = castShadow(p + nor * 0.001, sun_dir);
        float sky_dif = clamp(0.5 + 0.5 * dot(nor, vec3(0.0, 1.0, 0.0)), 0.0, 1.0);
        float bou_dif = clamp(dot(nor, vec3(0.0, -1.0, 0.0)), 0.0, 1.0);
        
        col = mate * vec3(1.0, 0.7, 0.4) * sun_dif * sun_sha;
        col += mate * vec3(0.0, 0.1, 0.3) * sky_dif;
        col += mate * vec3(0.8, 0.2, 0.2) * bou_dif;
    }
    
    col = pow(col, vec3(0.4545));
    
    gl_FragColor = vec4(col, 1.0);
}