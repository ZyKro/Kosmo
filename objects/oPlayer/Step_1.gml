player_input();

var Atk = (attack_key);

image_angle = point_direction(x,y,mouse_x,mouse_y);

    if Atk == 1 {
		with(instance_create_layer(x,y,"Flashlight", oFLight)){
			
			direction = other.image_angle;
			image_angle = direction;
		}
		
	}