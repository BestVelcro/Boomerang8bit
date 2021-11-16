if(!instance_exists(obj_player)) instance_destroy(); else{	
// Attack Key
key_attack = keyboard_check_pressed(ord("Z"));
key_teleport = keyboard_check_pressed(ord("X"));

// Keep it on the Player or move it into then 
if(!instance_exists(obj_boomeranghitLocation)){
if(locked){
	x = obj_player.x;
	y = obj_player.y;
	hsp = 0;
	vsp = 0;
	x_stop = false; y_stop = false;
}else{
	var player_xside = sign(obj_player.x - x);
	var player_yside = sign(obj_player.y - y);
	if(sign(hsp) != sign(throw_side)) returning = true;
	
	if(returning){
	acceleration_x += bspeed;
	acceleration_y += bspeed;
	hsp = player_xside * acceleration_x;
	vsp = player_yside * acceleration_y;
	
	x_location = x + hsp;
	if(player_xside != sign(obj_player.x - x_location)){
		x = obj_player.x;
		x_stop = true;
	}else x_stop = false;
	
	y_location = y + vsp;
	if(player_yside != sign(obj_player.y - y_location)){
		y = obj_player.y;
		y_stop = true;
	}else y_stop = false;
	
	}else{
		hsp += player_xside * bspeed;
		vsp += player_yside * bspeed;
	}
	
	image_angle += 45;
}
}else{
	x = obj_boomeranghitLocation.x;
	y = obj_boomeranghitLocation.y;
}
//If the attack Key is pressed, throw object according to player side
if(key_attack and locked){
	locked = false;
	hsp += (throw_power * obj_player.view_side)*obj_player.running;
	throw_start = true;
	throw_side = obj_player.view_side;
	acceleration_x = 0; acceleration_y = 0;
	returning = false;
}

//Teleport
if(key_teleport and !locked and cooldown >= maxcooldown){
	with(obj_player){
		if(!place_meeting(other.x,other.y,obj_collisionground)){
			other.safetp = true;
			other.tpoffset = 0;
		}else if(!place_meeting(other.x,other.y-(sprite_height/2),obj_collisionground)){
			other.safetp = true;
			other.tpoffset = sprite_height/2;
		}
	}
	if(safetp){
	obj_player.x = x;
	obj_player.y = y-tpoffset;
	instance_create_layer(x,y,"Weapon",obj_boomeranghit);
	instance_create_layer(x,y,"Weapon",obj_boomeranghitLocation);
	locked = true;
	safetp = false;
	}
	cooldown = 0;
}

//Check for Wall collision when going

if(place_meeting(x,y,obj_collisionground) and sign(hsp) == sign(throw_side) and !returning){
	hsp = hsp * -1;
	returning = true;
	repeat(5){
		var particle = instance_create_layer(x,y,"Weapon",obj_wallparticle);
		particle.speed = sign(hsp);
		particle.direction = direction-irandom_range(-45,45)
	}
	if(place_meeting(x,y,obj_player)) locked = true;
}

if(!locked and returning){
var back_enemies = ds_list_create();
hitCount = instance_place_list(x,y,all,back_enemies,true);
repeat(hitCount){
	with(ds_list_find_value(back_enemies, 0)){
		if(sign(x - other.x) != sign(x - obj_player.x)){
			for (var i = array_length_1d(obj_game.enemies) - 1; i > -1; i--;){
				if(object_index == obj_game.enemies[i]){
				state = "VULNERABLE";
				fall_side = sign(other.hsp);
				other.cooldown = other.maxcooldown;
				}
			}
		}
	}
	ds_list_delete(back_enemies, 0);
}
ds_list_destroy(back_enemies);
}


//Check for Enemy Collision
var possible_enemy = ds_list_create();
firstHit = instance_place_list(x,y,all,possible_enemy,true);
	if(firstHit > 0 and !returning and !locked){
repeat(firstHit){
	with(ds_list_find_value(possible_enemy, 0)){
		for (var i = array_length_1d(obj_game.enemies) - 1; i > -1; i--;){
		if(object_index == obj_game.enemies[i]){
			other.hsp = other.hsp * - 1;
			other.returning = true;
			other.cooldown = other.maxcooldown;
			if(object_index != obj_shieldenemy){
				EnemyParticles(100,-10, other, object_index);
				instance_destroy(); 
			}else callhit = true;
		}
		}
}
ds_list_delete(possible_enemy,0);
	}
			ds_list_destroy(possible_enemy);
			// if(place_meeting(x,y,obj_player)) locked = true;
}
if(!place_meeting(x,y,obj_player)) throw_start = false;

if(!x_stop) x += hsp;
if(!y_stop) y += vsp;
}