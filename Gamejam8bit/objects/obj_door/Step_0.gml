if(instance_exists(obj_spacebar) and instance_exists(obj_player)){
	if(place_meeting(x,y,obj_player)){
	obj_spacebar.image_alpha = 1;
	}else{
	obj_spacebar.image_alpha = 0;
	}
}