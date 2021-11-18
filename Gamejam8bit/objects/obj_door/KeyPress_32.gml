if(instance_exists(obj_skinnyenemy) or instance_exists(obj_shieldenemy)){
	show_debug_message("ainda tem gente bobo");
}else{
	global.newLevel = true;
	if(room_next(room) != -1){
		room_goto_next();
	}
}