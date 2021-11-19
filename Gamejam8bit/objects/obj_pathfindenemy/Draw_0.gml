draw_self();

if(ds_exists(ds_gridpathfinding,ds_type_grid)){
	draw_set_color(c_black);
	for(var i = 0; i < ds_grid_width(ds_gridpathfinding); i += 1){
		
		for(var j = 0; j < ds_grid_height(ds_gridpathfinding); j += 1){
			
			var value = ds_grid_get(ds_gridpathfinding,i,j);
			if(value != -1 and value != -2 and value != -3){
			draw_circle(i * obj_grid.cell_width+(obj_grid.cell_width/2), j * obj_grid.cell_height+(obj_grid.cell_height)/2, 3, false);
			/*draw_set_font(gridFont)
			 draw_text_transformed(i * obj_grid.cell_width+(obj_grid.cell_width/2), j * obj_grid.cell_height+(obj_grid.cell_height/2), string(value), 1, 1, 0);
			*/}
		}
	}
	show_debug_message(string(i)+" I");
	show_debug_message(string(j)+" J");
	draw_set_color(c_white);
}

if(path_exists(path_building)){
	draw_path(path_building,floor(x/obj_grid.cell_width),floor(y/obj_grid.cell_height),true);
}