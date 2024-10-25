uniform vec4 iMouse;
uniform vec2 iResolution;
uniform float iTime;


#define PI 3.14159265359
#define period (2.0 * PI)


//----------------------
// shape manipulations
//----------------------

float smin(in float a, in float b, float k)
{
    float h = max(k - abs(a-b), 0.0);
    return min(a,b) - h*h/(k*4.0);
}

float smax( float d1, float d2, float k )
{
    float h = clamp( 0.5 - 0.5*(d2+d1)/k, 0.0, 1.0 );
    return mix( d2, -d1, h ) + k*h*(1.0-h);
}

mat2 rotateY(float angle) // m x n matrix, m vertical, n horizontal
{
    float s = sin(angle); // c at 1-1, -s at 2-1 (left bottom), s at 1-2 (top right), c at 2-2
    float c = cos(angle); // ortho view with y up and z left, makes rotation counter clockwise
    return mat2(c, -s, s, c); // angle = 0.25 * period makes a quarter of a rotation
}


//----------------------
// shapes
//----------------------


float hash(float n, float seed) {
    return fract(sin(n) * seed);
}

float noise(vec2 p, float seed) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    float a = hash(i.x + hash(i.y, seed) * 57.0, seed);
    float b = hash(i.x + 1.0 + hash(i.y, seed) * 57.0, seed);
    float c = hash(i.x + hash(i.y + 1.0, seed) * 57.0, seed);
    float d = hash(i.x + 1.0 + hash(i.y + 1.0, seed) * 57.0, seed);
    
    vec2 u = f * f * (3.0 - 2.0 * f); // smoothstep
    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
}

float fbm(vec2 p, float seed)
{
    float total = 0.0;
    float amplitude = 1.8;
    p *= 0.2;
    for(int i = 0; i < 5; i++)
    {
        total += noise(p, seed) * amplitude;
        p *= 2.0; //increase frequency
        amplitude *= 0.4; //decrease amplitude
    }
    return total;
}

float sdTerrain(vec3 p)
{
    float d = p.y - (0.0);
    d += fbm(p.xz, 43758.5453);
    d *= 0.6;
    return d;
}



float sdSphere(vec3 p, float r)
{
    return length(p) - r;
}

float sdElipsoid(vec3 p, vec3 rad)
{
    float k0 = length(p/rad);
    float k1 = length(p/rad/rad);
    return k0*(k0-1.0)/k1;
}


vec2 sdCreature(vec3 p)
{
    float x = 1.1; //scaling head
    float sp = period * 25.0 / 12.0; //speed of run 
    
    vec3 q = p;
    
    vec3 cheJP = q - vec3(0.0, 0.015 * sin(iTime * sp), 0.1);
    vec3 cheJS = vec3(abs(cheJP.x), cheJP.yz);
    
        vec3 necJP = cheJP - vec3(0.0, 0.005 - 0.015 + 0.005 * sin(iTime * sp - 0.05 * period), 0.02);
        necJP.yz = rotateY(0.02 * period * sin(iTime * sp + 0.45 * period)) * necJP.yz;
                        
            vec3 heaJP = necJP - vec3(0.0, 0.06 + (0.006 * sin(iTime * sp + 0.2 * period)), 0.04);
            heaJP.yz = rotateY(0.02 * period * sin(iTime * sp - 0.05 * period)) * heaJP.yz;
            
            vec3 heaJS = vec3(abs(heaJP.x), heaJP.yz);
            
                                vec3 necP = 0.5 * necJP + 0.5 * heaJP - vec3(0.0, 0.0, -0.02);
                                necP.yz = rotateY(-0.14 * period) * necP.yz;
                                
                                vec3 snoP = heaJP - vec3(0.0, 0.0, 0.07) * x;
                                vec3 sn_P = snoP - vec3(0.0, 0.0, 0.033);
                                sn_P.yz = rotateY(0.1 * period) * sn_P.yz;
                                vec3 nosP = snoP - vec3(0.0, 0.01, 0.014);
                                
                                vec3 earP = heaJS - vec3(0.025, 0.045, 0.0) * x;
                                earP.xz = rotateY(-0.1 * period) * earP.xz;
                                
                                vec3 heaP = heaJS - vec3(0.0, 0.01, 0.02) * x;
                                
                                vec3 ey_P = heaP - vec3(0.035, 0.007, 0.025) * x;
                                ey_P.xz = rotateY(0.15 * period) * ey_P.xz;
                                vec3 eyeP = heaP - vec3(0.022, 0.002, 0.022) * x;
    
        vec3 shoJP = cheJS - vec3(0.03, -0.01, 0.01);
            
            vec3 fL1JP = shoJP - vec3(0.0, -0.02, -0.03);
            fL1JP.yz = rotateY(0.7 * sin(iTime * sp + 0.3 * period)) * fL1JP.yz;
            
                vec3 fL2JP = fL1JP - vec3(0.0, -0.14, 0.03);
                
                                vec3 fL1P = 0.5 * shoJP + 0.5 * fL1JP;
                                fL1P.yz = rotateY(0.03 * period) * fL1P.yz;
                                vec3 fL2P = 0.5 * fL1JP + 0.5 * fL2JP;
                                fL2P.yz = rotateY(-0.03 * period) * fL2P.yz;
                                vec3 fPaP = fL2JP - vec3(0.0, -0.01, 0.02);
    
    vec3 hipJP = q - vec3(0.0, 0.015 * sin(iTime * sp - 0.25 * period), -0.08);
    vec3 hipJS = vec3(abs(hipJP.x), hipJP.yz);
    
                                vec3 to1P = 0.68 * cheJP + 0.32 * hipJP;
                                to1P.yz = rotateY(0.01 * period) * to1P.yz;
                                vec3 to2P = 0.18 * cheJP + 0.82 * hipJP - vec3(0.0, 0.012, 0.0);
                                to2P.yz = rotateY(-0.04 * period) * to2P.yz;
    
        vec3 ta1JP = hipJP - vec3(0.0, 0.02, -0.02);
        ta1JP.yz = rotateY(0.2 * sin(iTime * sp - 0.55 * period)) * ta1JP.yz;
            
            vec3 ta2JP = ta1JP - vec3(0.0, 0.00, -0.1);
            
                                vec3 ta1P = 0.5 * ta1JP + 0.5 * ta2JP;
                                vec3 ta2P = ta2JP - vec3(0.0, 0.0, -0.03);
                                ta2P.yz = rotateY(0.3 * sin(iTime * sp - 0.75 * period)) * ta2P.yz;
    
        vec3 pelJP = hipJS - vec3(0.035, -0.01, -0.01 + (-0.005 + 0.025 * sin(iTime * sp + 0.3 * period)));
            
            vec3 hL1JP = pelJP - vec3(0.0, -0.05, 0.04);
            hL1JP.yz = rotateY(0.2 + 0.7 * sin(iTime * sp + -0.2 * period)) * hL1JP.yz;
            
                vec3 hL2JP = hL1JP - vec3(0.0, -0.06, -0.06);                
                
                    vec3 hL3JP = hL2JP - vec3(0.0, -0.05, 0.02);
                
                                vec3 hL1P = 0.6 * pelJP + 0.4 * hL1JP - vec3(0.0, -0.01, 0.0);
                                hL1P.yz = rotateY(-0.06 * period) * hL1P.yz;
                                vec3 hL2P = 0.5 * hL1JP + 0.5 * hL2JP;
                                hL2P.yz = rotateY(0.1 * period) * hL2P.yz;
                                vec3 hL3P = 0.5 * hL2JP + 0.5 * hL3JP;
                                hL3P.yz = rotateY(-0.03 * period) * hL3P.yz;
                                vec3 hPaP = hL3JP - vec3(0.0, -0.01, 0.018);
                
    
    //torso
    vec3 rad = vec3(0.05, 0.05, 0.085);
    float to1 = sdElipsoid(to1P, rad);
    float d = to1;
    
    rad = vec3(0.035, 0.038, 0.07);
    float to2 = sdElipsoid(to2P, rad);
    d = smin(d, to2, 0.02);
    
    //head
    rad = vec3(0.037, 0.037, 0.065) * x;
    float nec = sdElipsoid(necP, rad);
    d = smin(d, nec, 0.025);
    
    rad = vec3(0.035, 0.035, 0.045) * x;
    float hea = sdElipsoid(heaP, rad);
    d = smin(d, hea, 0.014);
    
    
    rad = vec3(0.005, 0.02, 0.02) * x;
    float ey_ = sdElipsoid(ey_P, rad);
    d = smax(ey_, d, 0.01);
    
    
    rad = vec3(0.018, 0.018, 0.03) * x;
    float sno = sdElipsoid(snoP, rad);
    d = smin(d, sno, 0.007);
    
    rad = vec3(0.03, 0.03, 0.01) * x;
    float sn_ = sdElipsoid(sn_P, rad);
    d = smax(sn_, d, 0.02);
    
    
    rad = vec3(0.015, 0.03, 0.01) * x;
    float ear = sdElipsoid(earP, rad);
    d = smin(d, ear, 0.01);
    

    //tail
    rad = vec3(0.015, 0.015, 0.06);
    float ta1 = sdElipsoid(ta1P, rad);
    d = smin(d, ta1, 0.01);
    
    rad = vec3(0.01, 0.01, 0.03);
    float ta2 = sdElipsoid(ta2P, rad);
    d = smin(d, ta2, 0.02);
    
    //legs
    
        //fL
        rad = vec3(0.02, 0.04, 0.02);
        float fL1 = sdElipsoid(fL1P, rad);
        d = smin(d, fL1, 0.01);
    
        rad = vec3(0.018, 0.08, 0.018);
        float fL2 = sdElipsoid(fL2P, rad);
        d = smin(d, fL2, 0.01);
    
        //hL
        rad = vec3(0.02, 0.045, 0.026);
        float hL1 = sdElipsoid(hL1P, rad);
        d = smin(d, hL1, 0.04);

        rad = vec3(0.018, 0.04, 0.018);
        float hL2 = sdElipsoid(hL2P, rad);
        d = smin(d, hL2, 0.02);
        
        rad = vec3(0.02, 0.042, 0.02);
        float hL3 = sdElipsoid(hL3P, rad);
        d = smin(d, hL3, 0.02);
    
        //pa
        rad = vec3(0.016, 0.012, 0.018);
        float fPa = sdElipsoid(fPaP, rad);
        d = smin(d, fPa, 0.014);
        float hPa = sdElipsoid(hPaP, rad);
        d = smin(d, hPa, 0.012);
    
    vec2 res = vec2(d, 2.0); // everything above is mat 2
    
    
    
    rad = vec3(0.007, 0.004, 0.005) * x;
    float nos = sdElipsoid(nosP, rad);
    d = smin(d, nos, 0.01);
    
    rad = vec3(0.01, 0.01, 0.01) * x;
    float eye = sdElipsoid(eyeP, rad);
    d = smin(d, eye, 0.001);
    
    if(d < res.x) res = vec2(d, 3.0); // everything above is mat 3
    

    return res;
}


float sdCylinder(vec3 p, float h, float r)
{
  vec2 d = abs(vec2(length(p.xz),p.y)) - vec2(r,h);
  return min(max(d.x,d.y),0.0) + length(max(d,0.0));
}

vec2 sdTree(vec3 p)
{
    float trunk = sdCylinder(p, 1.4, 0.05);
    vec2 res = vec2(trunk, 4.0); // everything above is mat 4
    
    vec3 cen = vec3(0.0, 3.0, 0.0);
    vec3 rad = vec3(0.6, 2.0, 0.6);
    float canopy = sdElipsoid(p - cen, rad);
    if(canopy < res.x) res = vec2(canopy, 5.0); // everything above is mat 5
    
    return res;
}


vec2 map(vec3 p)
{
    float terrain = sdTerrain(p);
    vec2 res = vec2(terrain, 1.0);
    
    if(p.y < -2.2) res.y = 6.0;
    

    vec3 cen = vec3(0.0, 0.0, iTime + 800.0);
    cen.y -= -0.2 + sdTerrain(cen) * 1.67;
    vec2 creature = sdCreature(p - cen);
    if(creature.x < res.x) res = creature;
    
    for (float x = -20.0; x <= 20.0; x += 10.0) {
        for (float z = -20.0; z <= 20.0; z += 8.0) {
            vec3 pos = vec3(x, 0.0, z + 800.0);
            pos.xz = rotateY(0.0005 * period) * pos.xz;
            pos.y -= sdTerrain(pos) * 1.67;
            //float sphere = sdSphere(p - pos, 0.5); 
            //if (sphere < res.x) res = vec2(sphere, 2.0); 
            vec2 tree = sdTree(p - pos); 
            if (tree.x < res.x) res = tree; 
        }
    }
    
    return res;    
}




//----------------------
// light calculations
//----------------------

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
        t += d.x;
        if(t > 30.0) break;
    }
    if(t > 30.0) m = -1.0;
    
    return vec2(t, m);
}

float castShadow(vec3 ro, vec3 rd)
{
    float res = 1.0;
    float t = 0.001;
    
    for(int i = 0; i < 100; i++)
    {
        vec3 p = ro + rd * t;
        float h = map(p).x;
        res = min(res, 16.0 * h / t);
        if(res < 0.0001) break;
        //t += h;
        //if(t > 20.0) break;/////////
        t += clamp(h, 0.5 + t * 0.05, 25.0); // iq in 'terrainShadow' function
    }
    
    return clamp(res, 0.0, 1.0);
}

vec3 calcNormal(vec3 p)
{
    vec2 e = vec2(0.1, 0.0); // error
    vec3 nor = normalize(vec3( map(p + e.xyy).x - map(p - e.xyy).x, 
                               map(p + e.yxy).x - map(p - e.yxy).x, 
                               map(p + e.yyx).x - map(p - e.yyx).x  ));
    return nor;
}

vec3 applyFog( in vec3  col,   // color of pixel
               in float t,     // distance to point
               in vec3  rd,    // camera to point
               in vec3  sun_dir )  // sun direction
{
    float fogStrength = 0.04;
    float fogAmount = 1.0 - exp(-t * fogStrength);
    float sunAmount = max( dot(rd, sun_dir), 0.0 );
    vec3  fogColor  = mix( vec3(0.5, 0.6, 0.7), // blue
                           vec3(1.0, 0.9, 0.7), // yellow
                           pow(sunAmount, 8.0)  );
    return mix(col, fogColor, fogAmount);
}


//----------------------
// main
//----------------------

void main()
{
    vec2 p = (gl_FragCoord.xy * 2.0 - iResolution.xy) / iResolution.y;
    
    
    //----------------------
    // camera
    //----------------------

    float camMove = iTime + 800.0;
    vec3 ta = vec3(0.0, -0.2, camMove);
    ta.y -= -0.2 + sdTerrain(ta) * 1.67;
    //float dCamTa = 1.0;
    //vec3 ro = ta + vec3(dCamTa, 0.0, 0.0);
    
    // comment out to disable cam navigation
    //float an = 10.0 * iMouse.x / iResolution.x;
    //ro = ta + vec3(dCamTa * sin(an), 0.0, dCamTa * cos(an));
    
    // comment out to disable rotating
        float t = iTime + 14.0;
        float an = 200.0 * (t * 1.1 + 2.0) / iResolution.x + 0.75 * period;
        float dCamTa = 2.25 - (1.75 * sin(t / 2.0 - 0.35 * period));

        vec3 ro = ta + vec3(dCamTa * sin(an), 0.5 + (0.35 * sin(t / 2.0 + 0.15 * period)), dCamTa * cos(an));
    
    vec3 ww = normalize(ta - ro);
    vec3 uu = normalize(cross(ww, vec3(0.0, 1.0, 0.0)));
    vec3 vv = normalize(cross(uu, ww));
    
    float fov = 1.8;
    vec3 rd = normalize(vec3(p.x * uu + p.y * vv + fov * ww));
    
    
    //----------------------
    // background
    //----------------------
    
    vec3 col = vec3(0.56,0.54,0.85) - 0.5 * (rd.y + 0.4);
    col = mix(col, vec3(0.93,0.84,0.84), exp(-10.0 * rd.y) / 5.0) * (0.4 + (1.0 - rd.y));
    
    //----------------------
    // raymarching
    //----------------------
    
    vec2 tm = castRay(ro, rd);
    if(tm.y > 0.0)
    {
        vec3 p = ro + rd * tm.x;
        vec3 nor = calcNormal(p);
        
        //----------------------
        // material
        //----------------------
        
        vec3 mat = vec3(0.2, 0.2, 0.2);
        if(tm.y < 1.5)
        {
            mat = vec3(0.4, 0.45, 0.1);
            mat *= 0.5 + 0.5 * vec3(fbm(p.xz, 93242.7114), fbm(p.xz, 34791.486), fbm(p.xz, 2462.6304));
        }
        else if(tm.y < 2.5)
        {
            mat = vec3(0.7, 0.6, 0.6);
        }
        else if(tm.y < 3.5) mat = vec3(0.2, 0.1, 0.1);
        else if(tm.y < 4.5) mat = vec3(0.2, 0.1, 0.1);
        else if(tm.y < 5.5) mat = vec3(0.2,0.4,0.3);
        
        else if(tm.y < 6.5) mat = vec3(0.043,0.114,0.176);
        
        
        
        //----------------------
        // lighting
        //----------------------

        vec3 sun_dir = normalize(vec3(0.8, 0.4, 0.2));
        float sun_dif = clamp(dot(nor, sun_dir), 0.0, 1.0);
        float sun_sha = castShadow(p + nor * 0.001, sun_dir);
        float sky_dif = clamp(0.5 + 0.5 * dot(nor, vec3(0.0, 1.0, 0.0)), 0.0, 1.0);
        float bou_dif = clamp(0.5 * dot(nor, vec3(0.0, -1.0, 0.0)), 0.0, 1.0);

        col = mat * vec3(1.0, 0.7, 0.4) * sun_dif * sun_sha;
        col += mat * vec3(0.0, 0.1, 0.3) * sky_dif;
        col += mat * vec3(0.8, 0.2, 0.2) * bou_dif;
        
        col = applyFog(col, tm.x, rd, sun_dir);
    }
    
    //----------------------
    // final
    //----------------------

    col = pow(col, vec3(0.4545));

    gl_FragColor = vec4(col, 1.0);
}
