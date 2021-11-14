if(instance_exists(obj_boomeranghit)){
	switch(obj_boomeranghit.image_index){
		case 0:
		sprite_set_offset(spr_boomeranghitLocation,60,39);
		break;
		case 1:
		sprite_set_offset(spr_boomeranghitLocation,65,20);
		break;
		case 2:
		sprite_set_offset(spr_boomeranghitLocation,64,11);
		break;
		case 3:
		sprite_set_offset(spr_boomeranghitLocation,61,6);
		break;
		case 4:
		sprite_set_offset(spr_boomeranghitLocation,59,2);
		break;
		case 5:
		sprite_set_offset(spr_boomeranghitLocation,57,0);
		break;
	}
	
	//Set Position
	boomerang_side = obj_boomeranghit.image_xscale;
	image_xscale = boomerang_side;
	if(boomerang_side == -1){
	xoffset_difference = sprite_get_xoffset(spr_boomeranghitLocation)-sprite_get_xoffset(spr_boomeranghit);
	yoffset_difference = sprite_get_yoffset(spr_boomeranghit)-sprite_get_yoffset(spr_boomeranghitLocation);
	}else{
	xoffset_difference = sprite_get_xoffset(spr_boomeranghitLocation)-sprite_get_xoffset(spr_boomeranghit);
	yoffset_difference = sprite_get_yoffset(spr_boomeranghitLocation)-sprite_get_yoffset(spr_boomeranghit);
	}
	x = obj_boomeranghit.x+(xoffset_difference * boomerang_side);
	y = obj_boomeranghit.y+(yoffset_difference * boomerang_side);
}