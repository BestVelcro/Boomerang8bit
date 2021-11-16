if(state == "VULNERABLE"){
	show_debug_message(string(image_angle));
	if(image_angle/90 != 1 and fall_side > 0 or image_angle/90 != -1 and fall_side < 0) image_angle += fall_side * 2;
}else hsp = side * walksp;

if(state == "IDLE"){
	walksp = default_walksp/2;

if(!place_meeting(x+(hsp+(side*sprite_width)),y+sprite_height,obj_collisionground) and !place_meeting(x+(hsp+(side*sprite_width)),y+sprite_height,obj_collisionplataform)){
	side = side * -1;
}

if(!action){
	alarm[0] = room_speed*(irandom(2)+1);
	action = true;
}
}

//Chasing movement
if(state = "CHASE"){
	var myfloor = instance_position(x,y,obj_currentfloor);
	var goto_floor = instance_position(goto_x,goto_y,obj_currentfloor);
	if(myfloor != goto_floor){
		// start
		var stairs = ds_list_create();
		with(myfloor){other.foundstairs = instance_place_list(x,y,all,stairs,true);}
		repeat(foundstairs){
		with(ds_list_find_value(stairs, 0)){
			if(other.goto_y > y and object_index == obj_endstair and other.y < y){
				if(distance_to_object(other) <= other.closest_stair){
					other.closest_stair = distance_to_object(other);
					other.best_stair = id;
				}
			}
				
			if(other.goto_y < y and object_index == obj_startstair){
				if(distance_to_object(other) <= other.closest_stair){
					other.closest_stair = distance_to_object(other);
					other.best_stair = id;
				}
			}
			
		}
		ds_list_delete(stairs, 0);
		}
		closest_stair = 9999;
		ds_list_destroy(stairs);
		//end
	}
}

//Horizontal Collision
var wall_collision = instance_place(x+hsp,y,obj_collisionground);
if(wall_collision != noone){
	while(!place_meeting(x+sign(hsp),y,obj_collisionground)){
		x += sign(hsp);
	}
	
	if(state == "CHASE"){
	if(wall_collision.bbox_top > bbox_top) and (place_meeting(x,y+1,obj_collisionground)){
		var floor_y = y;
		while(bbox_bottom >= wall_collision.bbox_top){
			y--
		}
		y--
		if(place_meeting(x+sign(hsp),y,obj_collisionground)) y = floor_y;
	}
	}
	
hsp = 0;	
}

x += hsp;

vsp += grv;

//Vertical Collision
if(place_meeting(x,y+vsp,obj_collisionground)){
	vsp = 0;
}

if(vsp > 0 and place_meeting(x,y+vsp,obj_collisionplataform) and !place_meeting(x,y,obj_collisionplataform)){
	vsp = 0;
}

y += vsp; 