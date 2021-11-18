if(instance_exists(obj_player)){
	// Fix position on player
	x = obj_player.x+ (obj_player.view_side*(obj_player.sprite_width/2));
	y = obj_player.y;
	image_xscale = obj_player.view_side;
	
	//Check collisions and call hits
	var enemies_hitted = ds_list_create();
	hitCount = instance_place_list(x,y,all,enemies_hitted,true);
repeat(hitCount){
	with(ds_list_find_value(enemies_hitted, 0)){
			for (var i = array_length_1d(obj_game.enemies) - 1; i > -1; i--;){
				if(object_index == obj_game.enemies[i]){
				if(object_index != obj_shieldenemy){
				EnemyParticles(100,-10, other, object_index);
				instance_destroy(); 
				obj_boomerang.cooldown = obj_boomerang.maxcooldown;
				}else callhit = true;
				}
			}
	}
	ds_list_delete(enemies_hitted, 0);
}
ds_list_destroy(enemies_hitted);
}