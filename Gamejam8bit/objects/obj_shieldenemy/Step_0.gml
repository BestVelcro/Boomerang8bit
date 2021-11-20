var see_distance = sprite_get_width(spr_hearsound);

knockback_power = clamp(knockback_power-game_gravity,0,knockback_maxpower);
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

	var myfloor = instance_position(x,y+sprite_height/2-1,obj_currentfloor);
	var goto_floor = instance_position(obj_player.location_x,obj_player.location_y,obj_currentfloor);
	if(last_floor != goto_floor){
	change_floor = true;
	last_floor = goto_floor;
	show_debug_message("test");
	}
	
if(state != "VULNERABLE"){
		if(callhit){
		var hitside = sign(obj_boomerang.x - x);
		image_xscale = hitside;
		image_index = 1; image_speed = 1;
		knockback_power = knockback_maxpower;
		knockback_side = sign(x - obj_boomerang.x);
		callhit = false;
	}
}else{
	speed_h = 0;
	if(image_angle/90 != 1 and fall_side > 0 or image_angle/90 != -1 and fall_side < 0) image_angle += fall_side * 2;
	if(callhit and instance_exists(obj_boomerang)){instance_destroy(); EnemyParticles(100,-10, obj_boomerang, self);obj_boomerang.cooldown = obj_boomerang.maxcooldown}
}
	
if(state == "IDLE"){
	if(distance < see_distance*1.5 and !collisions){
		state = "CHASE";
		action = false;
	}
	if(!action){
	action = true;
	alarm[0] = room_speed;
	}
}
	
if(state == "CHASE"){
	if(distance < floor(see_distance/3) and !collisions){
		state = "SHOOTING";
	}
if(distance < see_distance*1.5 and !collisions and myfloor == goto_floor){

	falling = false;
	check_path = false;
	speed_h = max_speed * sign(obj_player.x - x);
	saw_player = true;
	waiting = false;
     if path_exists(path_building) {
         path_delete (path_building);
     }
     path_point = 0 ;
     action = 0 ;
     jump_action = 0 ;

}else if(saw_player){
	saw_player = false;
	scr_call_pathfinding(obj_player.location_x,obj_player.location_y);
}

if(change_floor){
	change_floor = false;
	scr_call_pathfinding(obj_player.location_x,obj_player.location_y);
	show_debug_message("floor changed");
}

if(distance < see_distance*1.5 and !collisions and !check_path and myfloor != goto_floor){
	check_path = true;
	scr_call_pathfinding(obj_player.location_x,obj_player.location_y);
	show_debug_message(string(myfloor)+" < My floor | Player Floor > "+string(goto_floor));
}
if(!saw_player and !waiting){
	waiting = true;
	alarm[1] = room_speed*10;
}
}

if(state == "SHOOTING"){
	 speed_h = 0;
     if path_exists(path_building) {
         path_delete (path_building);
     }
     path_point = 0 ;
     action = 0 ;
     jump_action = 0 ;
	if(distance > floor(see_distance/3) or collisions){
		state = "CHASE";
		scr_call_pathfinding(obj_player.location_x,obj_player.location_y);
	}
}

falling = false;
// Follow the path if path exists
if path_exists(path_building)
{
    scr_follow_the_path(path_building);
}


// Apply gravity
if !place_meeting (x, y+1, obj_collisionground)
    {
        speed_v = speed_v + game_gravity ;
    }

// Check if there is a collsiion
scr_collision () ;

if(speed_h != 0){
	image_xscale = sign(speed_h);
}
}