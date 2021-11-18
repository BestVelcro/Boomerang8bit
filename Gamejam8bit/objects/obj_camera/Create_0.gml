view_width = 1920/3;
view_height = 1080/3;

window_scale = floor(display_get_height()/view_height);

window_set_size(view_width*window_scale,view_height*window_scale);
alarm[0] = 1;

