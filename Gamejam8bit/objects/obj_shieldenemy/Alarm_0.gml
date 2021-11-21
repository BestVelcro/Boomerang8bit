if(state = "IDLE"){
	var stop = choose(true,false);
	if(stop){
		speed_h = 0;
	}else{
	speed_h = (max_speed/2) * direction_go;
	direction_go = direction_go * -1;
	}
	action = false;
}