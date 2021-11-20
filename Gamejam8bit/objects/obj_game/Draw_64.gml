if(draw and instance_exists(obj_camera)){

	var w = sprite_get_width(spr_rkey)/4;
	var h = sprite_get_height(spr_rkey)/4;
	i = clamp(i+0.02,0,1);
	draw_sprite_ext(spr_rkey,0,obj_camera.view_width-w,obj_camera.view_height-h,0.5,0.5,0,c_white,i);
	// draw_sprite(spr_rkey,0,obj_camera.view_width,obj_camera.view_height);
}