/*
knockback_power = clamp(knockback_power-grv,0,knockback_maxpower);
knockback_move = knockback_power * knockback_side;
if(state != "VULNERABLE"){
		if(callhit){
		var hitside = sign(obj_boomerang.x - x);
		image_xscale = hitside;
		image_index = 1; image_speed = 1;
		knockback_power = knockback_maxpower;
		knockback_side = sign(x - obj_boomerang.x);
		callhit = false;
		state = "IDLE";
	}
}else{
	if(image_angle/90 != 1 and fall_side > 0 or image_angle/90 != -1 and fall_side < 0) image_angle += fall_side * 2;
	if(callhit and instance_exists(obj_boomerang)){instance_destroy(); EnemyParticles(100,-10, obj_boomerang, self);obj_boomerang.cooldown = obj_boomerang.maxcooldown}
}

if(state == "IDLE"){
hsp = side * walksp;

if(!place_meeting(x+(hsp+(side*sprite_width)),y+sprite_height,obj_collisionground) and !place_meeting(x+(hsp+(side*sprite_width)),y+sprite_height,obj_collisionplataform)){
	side = side * -1;
}
}

//Horizontal Collision
var wall_collision = instance_place(x+hsp,y,obj_collisionground);
if(wall_collision != noone){
	while(!place_meeting(x+sign(hsp),y,obj_collisionground)){
		x += sign(hsp);
	}
	
	if(wall_collision.bbox_top > bbox_top) and (place_meeting(x,y+1,obj_collisionground)){
		var floor_y = y;
		while(bbox_bottom >= wall_collision.bbox_top){
			y--
		}
		y--
		if(place_meeting(x+sign(hsp),y,obj_collisionground)){y = floor_y; side = side * -1;}
	}else{
		side = side * -1;
	}
	
hsp = 0;	
}

x += hsp + knockback_move;

vsp += grv;

//Vertical Collision
if(place_meeting(x,y+vsp,obj_collisionground)){
	vsp = 0;
}

if(vsp > 0 and place_meeting(x,y+vsp,obj_collisionplataform) and !place_meeting(x,y,obj_collisionplataform)){
	vsp = 0;
}

y += vsp; 

*////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

var see_distance = sprite_get_width(spr_hearsound);

knockback_power = clamp(knockback_power-grv,0,knockback_maxpower);
knockback_move = knockback_power * knockback_side;

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

if(state != "VULNERABLE"){
		if(callhit){
		var hitside = sign(obj_boomerang.x - x);
		image_xscale = hitside;
		image_index = 1; image_speed = 1;
		knockback_power = knockback_maxpower;
		knockback_side = sign(x - obj_boomerang.x);
		callhit = false;
		state = "IDLE";
	}
	hsp = side * walksp;
}else{
	if(image_angle/90 != 1 and fall_side > 0 or image_angle/90 != -1 and fall_side < 0) image_angle += fall_side * 2;
	if(callhit and instance_exists(obj_boomerang)){instance_destroy(); EnemyParticles(100,-10, obj_boomerang, self);obj_boomerang.cooldown = obj_boomerang.maxcooldown}
}

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
		side = sign(best_stair.x - x);
		newsound = false;
		descending = false;
		previous_floor = myfloor;
		last_y = y;
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

	if(distance < sprite_width*2 and !collisions and abs(y - obj_player.y) < 20){
			stop = true;
	}

//Chasing movement
if(state = "CHASE"){
	
	walksp = default_walksp*2;
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
		side = sign(best_stair.x - x);
		newsound = false;
		descending = false;
		previous_floor = myfloor;
		last_y = y;
		alarm[3] = room_speed*10;
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
	}else{
		hsp = 0;
	}
}

if(place_meeting(x+hsp,y,obj_player)){
	while(!place_meeting(x+sign(hsp),y,obj_player)){
		x += sign(hsp);
		}
	hsp = 0;
}

if(stop){
		hsp = 0;
		if(distance > sprite_width*3 or collisions){
			stop = false;
		}
}

x += hsp + knockback_move;

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
if(side != 0) image_xscale = side;
	}
