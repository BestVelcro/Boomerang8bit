var see_distance = sprite_get_width(spr_hearsound);

if(instance_exists(obj_player)){
	if(!instance_exists(obj_collisionenemy)) instance_create_depth(0,0,1000,obj_collisionenemy);
	obj_collisionenemy.x = x;
	obj_collisionenemy.y = y;
	obj_collisionenemy.image_angle = point_direction(x,y,obj_player.x,obj_player.y);
	obj_collisionenemy.image_xscale = point_distance(x,y,obj_player.x,obj_player.y);
	obj_collisionenemy.image_yscale = 4/sprite_get_height(spr_collisionenemy);
	collisions = false;
	with(obj_collisionenemy){
		if(place_meeting(x,y,obj_collisionground)){
			other.collisions = true;
		}
	}
	var distance = distance_to_object(obj_player);
	var moving = false;

if(state == "VULNERABLE"){
	fall = true;
	if(image_angle/90 != 1 and fall_side > 0 or image_angle/90 != -1 and fall_side < 0) image_angle += fall_side * 2;else{
		if(distance < see_distance/2 and !collisions){
			state = "SHOOTING";
		}
	}
}else hsp = side * walksp;

if(state == "IDLE"){
	
	if(distance < see_distance and !collisions){
		state = "CHASE";
	}
	
	walksp = default_walksp/2;
	goto_x = spawn_x;
	goto_y = spawn_y;
	if(spawn_y-15 > y or spawn_y+15 < y){
		action = false;
	moving = true;
	var myfloor = instance_position(x,y+sprite_height/2,obj_currentfloor);
	var goto_floor = instance_position(goto_x,goto_y,obj_currentfloor);
	if(myfloor != goto_floor){
		// start
		current_floor = myfloor;
		if(current_floor != previous_floor or newsound){
		var stairs = ds_list_create();
		with(myfloor){other.foundstairs = instance_place_list(x,y,all,stairs,true);}
		repeat(foundstairs){
		with(ds_list_find_value(stairs, 0)){
			var floor_stair = instance_place(x,other.goto_y,obj_currentfloor);
			var goto_floor = instance_position(other.goto_x,other.goto_y,obj_currentfloor);
			if(goto_floor == floor_stair){
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
		}
		ds_list_delete(stairs, 0);
		}
		closest_stair = 9999;
		ds_list_destroy(stairs);
		side = sign(best_stair.x - x);
		newsound = false;
		descending = false;
		previous_floor = myfloor;
		last_y = y;
		alarm[3] = room_speed*10;
		}
		
		if(y-last_y > 5 and goto_floor.y < y and bbox_bottom < best_stair.y){
			side = side * -1;
		}
		
		if(position_meeting(x,y+1+(sprite_height/2),best_stair) and y < goto_floor.y){
			var plataform = instance_nearest(x,y,obj_collisionplataform);
			side = sign(plataform.x - x);
			descending = true;
		}
	}
		if(myfloor == goto_floor){
		side = sign(goto_x - x);
	if(x+hsp >= goto_x and side > 0){
		x = goto_x
		hsp = 0;
		side = 0;
	}
	if(x+hsp <= goto_x and side < 0){
		x = goto_x
		hsp = 0;
		side = 0;
	}
	}
	}else if(spawn_x-100 > x or spawn_x+100 < x){
		moving = true;
		side = sign(goto_x - x);
	if(x+hsp >= goto_x and side > 0){
		x = goto_x
		hsp = 0;
		side = 0;
	}
	if(x+hsp <= goto_x and side < 0){
		x = goto_x
		hsp = 0;
		side = 0;
	}
	
}

if(!action and !moving){
	alarm[0] = room_speed//*(irandom(2)+1);
	action = true;
}
}

//Chasing movement
if(state = "CHASE"){
		if(distance < see_distance and !collisions){
			state = "SHOOTING";
		}
	walksp = default_walksp;
	var myfloor = instance_position(x,y+sprite_height/2,obj_currentfloor);
	var goto_floor = instance_position(goto_x,goto_y,obj_currentfloor);
	if(myfloor != goto_floor){
		// start
		current_floor = myfloor;
		if(current_floor != previous_floor or newsound){
		var stairs = ds_list_create();
		with(myfloor){other.foundstairs = instance_place_list(x,y,all,stairs,true);}
		repeat(foundstairs){
		with(ds_list_find_value(stairs, 0)){
			var floor_stair = instance_place(x,other.goto_y,obj_currentfloor);
			var goto_floor = instance_position(other.goto_x,other.goto_y,obj_currentfloor);
			if(goto_floor == floor_stair){
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
		}
		ds_list_delete(stairs, 0);
		}
		closest_stair = 9999;
		ds_list_destroy(stairs);
		if(best_stair != noone) side = sign(best_stair.x - x);
		newsound = false;
		descending = false;
		previous_floor = myfloor;
		last_y = y;
		}
		
		if(y-last_y > 3 and goto_floor.y < y and bbox_bottom < best_stair.y and sign(best_stair.x - x) == side){
			side = side * -1;
		}
		
		if(position_meeting(x,y+1+(sprite_height/2),best_stair) and y < goto_floor.y){
			var plataform = instance_nearest(x,y,obj_collisionplataform);
			side = sign(plataform.x - x);
			descending = true;
		}
		
		

	}
	if(myfloor == goto_floor){
		side = sign(goto_x - x);
		
	if(x+hsp >= goto_x and side > 0){
		x = goto_x
		hsp = 0;
		side = 0;
	}
	if(x+hsp <= goto_x and side < 0){
		x = goto_x
		hsp = 0;
		side = 0;
	}
	}
	
	if(distance < see_distance*1.5 and !collisions){
		goto_x = obj_player.x;
		goto_y = obj_player.y;
		saw_player = true;
		last_seen_x = obj_player.x;
		last_seen_y = obj_player.y;
		out_of_sight = false;
		place_seen = false;
	}else if(saw_player){
		goto_x = last_seen_x;
		goto_y = last_seen_y;
		newsound = true;
		saw_player = false;
		out_of_sight = true;
	}
	if(point_distance(x,y,goto_x,goto_y) <= 100 and !saw_player and !place_seen){
		place_seen = true;
		alarm[1] = room_speed*2;
	}
}

	if(state == "SHOOTING"){
		hsp = 0;
		if(instance_exists(obj_player)){
			if(not_shot){
		var bullet = instance_create_layer(x,y,"Weapon",obj_enemybullet);
		var player_angle = point_direction(x,y,obj_player.x,obj_player.y);
		bullet.direction = player_angle;
		bullet.image_angle = player_angle;
		alarm[2] = room_speed/2;
		not_shot = false;
			}
		}
		if(distance > see_distance or collisions){
			state = "CHASE";
			goto_x = obj_player.x;
			goto_y = obj_player.y;
		}
		if(distance > see_distance/2 and fall or collisions and fall){state = "VULNERABLE";}
	}
	
//Horizontal Collision
var wall_collision = instance_place(x+hsp,y,obj_collisionground);
if(wall_collision != noone){
	while(!place_meeting(x+sign(hsp),y,obj_collisionground)){
		x += sign(hsp);
		}
	
	if(wall_collision.bbox_top > bbox_top) and (place_meeting(x,y+1,obj_collisionground)){	
		var floor_y = y;
		if(state == "CHASE" or moving){
		while(bbox_bottom >= wall_collision.bbox_top){
			y--
		}
		y--
		}
		if(place_meeting(x+sign(hsp),y,obj_collisionground)){ y = floor_y; hsp = 0;}
	}else if(wall_collision.bbox_top > bbox_top) and (!place_meeting(x,y+1,obj_collisionground)){
		hsp = 0;
	}
}

x += hsp;

vsp += grv;

//Vertical Collision
if(place_meeting(x,y+vsp,obj_collisionground)){
	vsp = 0;
}

if(vsp > 0 and place_meeting(x,y+vsp,obj_collisionplataform) and !place_meeting(x,y,obj_collisionplataform) and !descending){
	vsp = 0;
}

last_y = y;

y += vsp; 
	}
