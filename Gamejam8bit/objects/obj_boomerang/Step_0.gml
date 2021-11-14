if(!instance_exists(obj_player)) instance_destroy(); else{	
// Attack Key
key_attack = keyboard_check_pressed(ord("Z"));
key_charge = keyboard_check(ord("Z"));
key_teleport = keyboard_check_pressed(ord("X"));

// Keep it on the Player or move it into then 
if(locked){
	x = obj_player.x;
	y = obj_player.y;
	hsp = 0;
	vsp = 0;
}else{
	hsp += sign(obj_player.x - x) * bspeed;
	vsp += sign(obj_player.y - y) * bspeed;
	image_angle += 45;
}

//Charging Attack
if(key_charge and locked){
	throw_power = clamp(throw_power+1,throw_minpower,throw_maxpower);
}

//If the attack Key is pressed, throw object according to player side
if(key_attack and locked){
	locked = false;
	hsp += (throw_maxpower * obj_player.view_side)*obj_player.running;
	throw_start = true;
	throw_power = throw_minpower
	throw_side = obj_player.view_side;
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
		show_debug_message(string(particle.image_angle));
	}
}


//Check for Enemy Collision
var possible_enemy = instance_place(x,y,all);
if(possible_enemy != noone and sign(hsp) == sign(throw_side) and !returning and !locked){
	for (var i = array_length_1d(obj_game.enemies) - 1; i > -1; i--;){
	if(possible_enemy.object_index == obj_game.enemies[i]){
			hsp = hsp * -1;
			returning = true;
			repeat(5){
			var particle = instance_create_layer(x,y,"Weapon",obj_enemyparticle);
			particle.speed = sign(hsp);
			particle.direction = direction-irandom_range(-45,45)
			show_debug_message(string(particle.image_angle));
			}
			instance_destroy(possible_enemy);
			cooldown = maxcooldown;
	}
	}
}

if(!locked){
var back_enemies = ds_list_create();
hitCount = instance_place_list(x,y,all,back_enemies,true);
repeat(hitCount){
	with(ds_list_find_value(back_enemies, 0)){
			for (var i = array_length_1d(obj_game.enemies) - 1; i > -1; i--;){
				if(object_index == obj_game.enemies[i]){
				repeat(5){
				var particle = instance_create_layer(other.x,other.y,"Weapon",obj_enemyparticle);
				particle.speed = sign(other.hsp);
				particle.direction = direction-irandom_range(-45,45)
				show_debug_message(string(particle.image_angle));
				}
				instance_destroy();
				other.cooldown = other.maxcooldown;
				}
			}
	}
	ds_list_delete(back_enemies, 0);
}
ds_list_destroy(back_enemies);
}


if(!place_meeting(x,y,obj_player)) throw_start = false;

x += hsp;
y += vsp;
show_debug_message(string(cooldown));
}