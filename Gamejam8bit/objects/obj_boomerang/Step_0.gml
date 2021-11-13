if(!instance_exists(obj_player)) instance_destroy(); else{	
// Attack Key
key_attack = keyboard_check_released(ord("Z"));
key_charge = keyboard_check(ord("Z"));

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
if(key_attack){
	locked = false;
	hsp += (throw_power * obj_player.view_side)*obj_player.running;
	throw_start = true;
	throw_power = throw_minpower
}

if(!place_meeting(x,y,obj_player)) throw_start = false;

x += hsp;
y += vsp;
}