#macro view view_camera[0]

camera_set_view_size(view,view_width,view_height);

x += (xTo - x)/25;
y += (yTo - y)/25;

if(follow != noone and instance_exists(follow)){
	xTo = clamp(follow.x-view_width/2,0,room_width-view_width);
	yTo = clamp(follow.y-view_height/2,0,room_height-view_height);
	camera_set_view_pos(view,x,y);
}