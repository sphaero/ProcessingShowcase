// class to display a circle
public class ccircle {
    // position
    int x;
    int y;

    // dimensions
    int radius;

    // color
    color col;

    ccircle(int x, int y, int radius, color col) {
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.col = col;
    }

    public void draw() {
        // set the color
        fill(col);

        // draw the circle
        circle(x, y, radius);
    }
};

public class rrectangle {   
    // position
    int x;
    int y;

    // dimensions
    int width;
    int height;

    // color
    color col;

    rrectangle(int x, int y, int width, int height, color col) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.col = col;
    }

    public void draw() {
        // set the color
        fill(col);

        // draw the circle
        rect(x, y, width, height);
    }    
}

public class ttriangle {
    int x_1;
    int y_1;

    int x_2;
    int y_2;

    int x_3;
    int y_3;

    // color
    color col;

    ttriangle(int x_1, int y_1, int x_2, int y_2, int x_3, int y_3, color col) {
        this.x_1 = x_1;
        this.y_1 = y_1;
        this.x_2 = x_2;
        this.y_2 = y_2;
        this.x_3 = x_3;
        this.y_3 = y_3;        
        this.col = col;
    }
    public void draw() {
        // set the color
        fill(col);

        //draw the triangle
        triangle(x_1, y_1, x_2, y_2, x_3, y_3);
    }
};

// the black background
rrectangle background;

// the sun
ccircle sun;

// counter for the moving road
float counter = 1.f;

// angle for the triangles
float triangle_angle = 0.f;
int triangle_count = 3;
int max_triangle_size = 150;
int min_triangle_size = 50;

// colors
color darkblue = color(40,38,75);
color midblue = color(78,81,116);
color lightblue = color(149,158,201);
color white = color(232,234,231);
color red = color(164,0,51);
color[] colAll = { darkblue, midblue, lightblue, white, red};

void setup() {
    // set the size of the window
    size(720, 480, P3D);

    // disable resizing
    surface.setResizable(false);

    // disable the stroke
    noStroke();

    // create the background
    background = new rrectangle(
        0, 0,
        width,
        height,
        darkblue
    );

    // create the sun
    sun = new ccircle(
        int(width / 2), 
        int(height / 3 * 1.5), 
        height / 2, 
        red
    );
}

void draw() {
    // print the highway
    float raster = 1.f;
    float width_road = 1.f;

    // draw the background
    background.draw();

    // draw the sun
    sun.draw();

    // create the background of the road
    rrectangle road = new rrectangle(
        0, int(height / 2),
        width, height,
        color(0, 0, 0)
    );

    // draw the background of the road
    road.draw();

    // draw the lines of the road to make it
    // look like it is moving
    while (raster < height) {
        // create a piece of the road with varying
        // heigth and color 
        rrectangle r = new rrectangle(
            0, int(height / 2 + raster),
            width, int(sq(raster) / 100),
            color((raster / 2))
        );
        
        // draw the rectangle
        r.draw();

        raster = raster * 1.2 * counter;

        width_road = width_road + 1.f;
    }

    counter = counter * 1.0015;

    // make the illusion that the road moves
    if (counter > 1.0074) {
        counter = 1.f;
    }


    // draw the white middle line
    ttriangle lt = new ttriangle (
        width / 2, height / 2,
        width / 2, height,
        width / 2 - 15, height,
        color(255)
    );

    ttriangle rt = new ttriangle (
        width / 2, height / 2,
        width / 2, height,
        width / 2 + 15, height,
        color(255)
    );

    lt.draw();
    rt.draw();

    // draw the green sides
    ttriangle ls = new ttriangle(
        0, height / 2,
        (width / 2) - height / 4 + 55, height / 2,
        0, height,
        white
    );
    
    ttriangle rs = new ttriangle(
        width, height / 2,
        (width / 2) + height / 4 - 55, height / 2,
        width, height,
        white
    );

    ls.draw();
    rs.draw();

    // enable the stroke for the triangles
    stroke(lightblue);
    strokeWeight(5);

    // draw the moving triangles
    for (int i = 0; i < triangle_count; i = i + 1) {
        // disable fill for the triangles
        noFill();

        int divisor = 360 / triangle_count;

        float curr_triangle_size = random(min_triangle_size, max_triangle_size);

        // draw the triangle
        triangle(
            int(width / 2 + curr_triangle_size * cos(radians(i * (divisor / triangle_count) + triangle_angle))),
            int(height / 2 + curr_triangle_size * sin(radians(i * (divisor / triangle_count) + triangle_angle))),
            int(width / 2 + curr_triangle_size * cos(radians(i * (divisor / triangle_count) + triangle_angle + 120))),
            int(height / 2 + curr_triangle_size * sin(radians(i * (divisor / triangle_count) + triangle_angle + 120))),
            int(width / 2 + curr_triangle_size * cos(radians(i * (divisor / triangle_count) + triangle_angle + 240))),
            int(height / 2 + curr_triangle_size * sin(radians(i * (divisor / triangle_count) + triangle_angle + 240)))
        );
    }

    // disable the stroke again.
    noStroke();

    triangle_angle = triangle_angle + 1;
}
