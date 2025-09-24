player_input();
var xmove = (right - left)*spd;
var ymove = (down - up)*spd;
var ySprint = (run_key*(down - up))*spd;
var xSprint = (run_key*(right - left))*spd;
xspd = xmove + xSprint;
yspd = ymove + ySprint;

    
    
   
    //x collision
    if place_meeting(x+xspd, y, col_map) {
        while(!place_meeting(x+sign(xspd), y, col_map)) {
            x += sign(xspd); // subpixel movement for smooth movement
        }
        xspd = 0;
    }

    x += xspd;
    
    //y collision
    if place_meeting(x, y+yspd, col_map) {
        while(!place_meeting(x, y+sign(yspd), col_map)) {
            y += sign(yspd); // subpixel movement for smooth movement
        }
        yspd = 0;
    }

    y += yspd;
