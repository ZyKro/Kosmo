player_input();
var xmove = (right - left)*spd;
var ymove = (down - up)*spd;
var ySprint = (run_key*(ymove))*spd;
var xSprint = (run_key*(xmove))*spd;
var Atk = (attack_key);
xspd = xmove + xSprint;
yspd = ymove + ySprint;
x = oPlayer.x;
y = oPlayer.y;

image_angle = point_direction(x,y,mouse_x,mouse_y);
    if Atk == 1 {
		with(instance_create_layer(x,y,"Bullets", oBullet)){
			speed = 20;
			direction = other.image_angle;
			image_angle = direction;
		}
		
	}
    
   
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
