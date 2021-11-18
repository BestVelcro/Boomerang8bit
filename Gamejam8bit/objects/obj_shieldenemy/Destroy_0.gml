var sound_range = instance_create_layer(x,y,"Enemies",obj_hearsound);
with(sound_range){
var possible_enemy = ds_list_create();
heard = instance_place_list(x,y,all,possible_enemy,true);
repeat(heard){
	with(ds_list_find_value(possible_enemy, 0)){
		for (var i = array_length_1d(obj_game.enemies) - 1; i > -1; i--;){
		if(object_index == obj_game.enemies[i]){
			state = "CHASE";
			goto_x = other.x;
			goto_y = other.y;
		}
		}
}
ds_list_delete(possible_enemy,0);
	}
			ds_list_destroy(possible_enemy);
}
instance_destroy(sound_range);