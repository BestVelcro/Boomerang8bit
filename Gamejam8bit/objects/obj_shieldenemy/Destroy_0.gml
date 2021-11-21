if(!bbox_right || !bbox_bottom || bbox_left>=room_width || bbox_top>=room_height){

}else{
var range = instance_create_layer(x,y,"Enemies",obj_hearsound);
with(range){
	image_xscale = 2;
	image_yscale = 2;
	var _hitList = ds_list_create();
	hitCount = instance_place_list(x,y,all,_hitList,true);
	repeat(hitCount){
		with(ds_list_find_value(_hitList, 0)){
	for (var i = array_length_1d(obj_game.enemies) - 1; i > -1; i--;){
			if(object_index == obj_game.enemies[i]){
			if(state != "CHASE" and state != "SHOOTING" and state != "VULNERABLE"){
			var alert = instance_create_layer(x,y,"HUD",obj_spotted);
			alert.owner = id;
			state = "CHASE";
			scr_call_pathfinding(other.x,other.y);
			}
			}
	}
		}
		ds_list_delete(_hitList,0);
	}
	image_xscale = 1;
	image_yscale = 1;
	instance_destroy();
}
}