view_width = 1920/3;
view_height = 1080/3;

if(instance_exists(obj_player)) follow = obj_player;

	xTo = clamp(follow.x-view_width/2,0,room_width-view_width);
	yTo = clamp(follow.y-view_height/2,0,room_height-view_height);
	
	x = xTo;
	y = yTo;
	
	camera_set_view_pos(view,x,y);

window_scale = floor(display_get_height()/view_height);


