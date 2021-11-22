if(instance_exists(obj_skinnyenemy) or instance_exists(obj_shieldenemy)){
	show_debug_message("ainda tem gente bobo");
}else if(instance_exists(obj_player)){
	if(place_meeting(x,y,obj_player) and !dontgo){
		dontgo = true;
	audio_play_sound(choose(OpenDoor1,OpenDoor2),300,false);
	global.newLevel = true;
	if(room_next(room) != -1){
		room_goto_next();
	}
	}
}