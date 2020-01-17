class rectangle {
    // position
    int x;
    int y;

    // dimensions
    int width;
    int height;

    // color
    int red = 0;
    int green = 0;
    int blue = 0;
    color col;

    // scale
    float scale_width = 1;
    float scale_height = 1;

    // the constructor
    rectangle(int _x, int _y, int _width, int _height) {
        x = _x;
        y = _y;
        width = _width;
        height = _height;
    }

    // setter fuction
    void set_color(int _red, int _green, int _blue) {
        red = _red;
        green = _green;
        blue = _blue;
        col = colAll[int(random(1,5))];
    }

    void set_pos(int _x, int _y) {
        x = _x;
        y = _y;
    }

    void set_dimension(int _width, int _height) {
        width = _width;
        height = _height;
    }

    void scale(float width_s, float height_s) {
        scale_width = width_s;
        scale_height = height_s;
    }

    void draw() {
        // set the collor of the rectangle
        fill(col);

        noStroke();

        // draw the rectangle
        rect(int(x * scale_width), int(y * scale_height), int(width * scale_width), int(height * scale_height));
    }

    void update() {
        // add a random direction
        x = x + round(random(-1.5, 1.5));
        y = y + round(random(-1.5, 1.5));
    }
};

class circle {
    // position
    int x;
    int y;

    // dimensions
    int radius;

    // color
    int red = 0;
    int green = 0;
    int blue = 0;

    // scale
    float scale_width = 1;
    float scale_height = 1;

    circle(int _x, int _y, int _radius) {
        x = _x;
        y = _y;
        radius = _radius;
    }

    void set_color(int _red, int _green, int _blue) {
        red = _red;
        green = _green;
        blue = _blue;
    }

    void set_pos(int _x, int _y) {
        x = _x;
        y = _y;
    }

    void set_dimension(int _radius) {
        radius = _radius;
    }

    void scale(float width_s, float height_s) {
        scale_width = width_s;
        scale_height = height_s;
    }

    void draw() {
        // set the collor of the rectangle
        fill(red, green, blue);

        noStroke();

        // draw the rectangle
        circle(int(x * scale_width), int(y * scale_height), int(radius * scale_width));
    }

    void update() {
        // add a random direction
        x = x + round(random(-1.5, 1.5));
        y = y + round(random(-1.5, 1.5));
    }
};

// list with 5000 elements(rectangles)
rectangle[] boxes = new rectangle[5000];
circle c;

// initial screen size
float start_width, start_height;

// become smaller first
boolean circle_dir = false;
int count = 0;

//colors 
color darkblue = color(40,38,75);
color midblue = color(78,81,116);
color lightblue = color(149,158,201);
color white = color(232,234,231);
color red = color(164,0,51);
color[] colAll = { darkblue, midblue, lightblue, white, red};

void setup() {
    surface.setResizable(true);
    size(1200, 800);

    // loop
    for (int i = 0; i < boxes.length; i = i + 1) {
        boxes[i] = new rectangle(int(random(width)), int(random(height)), int(random(10, 30)), int(random(10, 30)));

        boxes[i].set_color(int(random(255)), int(random(255)), int(random(255)));
    }

    // update initial screen size
    start_width = width;
    start_height = height;

    // create circle
    c = new circle(width / 2, height / 2, 100);
    c.set_color(255, 255, 255);
}

void draw() {
    // clear the screen
    fill(0,0,0);
    rect(0, 0, width, height);

    // calculate scale
    float width_scale = width / start_width;
    float height_scale = height / start_height;

    for (int i = 0; i < boxes.length; i = i + 1) {
        // resize
        boxes[i].scale(width_scale, height_scale);

        // animate box
        boxes[i].update();

        // draw
        boxes[i].draw();
    }

    // resize circle
    c.scale(width_scale, height_scale);
    
    // check if we need to update the animation of the circle
    if (count >= 3) {
        count = 0;

        // animate circle
        if (circle_dir == true) {
            // change size to a bigger size
            c.set_dimension(c.radius + 1);

            if (c.radius >= 300) {
                circle_dir = false;
            }
        } 
        else {
            // change size to a smaller size
            c.set_dimension(c.radius - 1);

            // check if circle is to small
            if (c.radius <= 50) {
                circle_dir = true;
            }
        }
    }

    // draw circle
    c.draw();

    // update counter for circle
    count = count + 1;
}
