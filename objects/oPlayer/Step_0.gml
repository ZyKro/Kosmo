player_input();
var xmove = (right - left)*spd;
var ymove = (down - up)*spd;

var ySprint = run_key*ymove;
var xSprint = run_key*xmove;

var ySprint = (run_key*(ymove))*spd;
var xSprint = (run_key*(xmove))*spd;

var Atk = (attack_key);
xspd = xmove + xSprint;
yspd = ymove + ySprint;
x = oPlayer.x;
y = oPlayer.y;

#region Debug and more
var debug_key = keyboard_check_pressed(ord("V"));
if debug_key {
    _vis = !_vis;
    layer_set_visible(layer_id, _vis);
}
#endregion

image_angle = point_direction(x,y,mouse_x,mouse_y);

    if Atk == 1 {
		with(instance_create_layer(x,y,"Bullets", oBullet)){
			speed = 20;
			direction = other.image_angle;
			image_angle = direction;
		}
		
	}
    
    var _subpixel = 0.5;

    //x collision
    if place_meeting(x+xspd, y, col_map)  {
        
        //partial slope collision
        if !place_meeting(x+xspd, y-abs(xspd)-1, col_map) // the abs(xspd) - 1 is padding to prevent locking on slopes
        { 
            while place_meeting(x+xspd, y, col_map) y -= _subpixel;
        }
        else 
        {
            var _pixelCheck = _subpixel * sign(xspd); //tighter collision
            while(!place_meeting(x+sign(xspd), y, col_map)) 
            {
                x += _pixelCheck;
            }
            xspd = 0;
        }
    }
    x += xspd;
    
    //y collision
    if place_meeting(x, y+yspd, col_map) 
    {
        var pixelCheck = _subpixel * sign(yspd);
        while(!place_meeting(x, y+sign(yspd), col_map)) 
        {
            y += pixelCheck;
        }
            yspd = 0; 
    }
    y += yspd;
