if(start and !random_start){
	random_start = true;
	alarm[1] = irandom_range(20,100);
}
if(instance_exists(obj_player) and go and !new_enemy and count < 4){
	image_index = 1;
	count++;
	if(count < 4){
	var sprite_h = sprite_get_height(spr_skinnyenemy);
	var sprite_w = sprite_get_width(spr_skinnyenemy);
	var spawn_y = y+sprite_height-(sprite_h/2);
	instance_create_layer(x+(sprite_w/2),spawn_y,"Enemies",obj_fakeskinny);
	}else{
	var sprite_h = sprite_get_height(spr_shieldenemy);
	var sprite_w = sprite_get_width(spr_shieldenemy);
	var spawn_y = y+sprite_height-(sprite_h/2);
	instance_create_layer(x+(sprite_w/2),spawn_y,"Enemies",obj_fakeshield);
	}
	new_enemy = true;
	alarm[0] = room_speed/4;
}
if(count >= 4 and start){
	start = false;
	alarm[0] = room_speed*4;
}