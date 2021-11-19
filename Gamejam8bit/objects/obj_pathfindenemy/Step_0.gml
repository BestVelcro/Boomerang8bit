if (keyboard_check_pressed(ord("S"))){
	scr_fill_the_grid(floor(x/obj_grid.cell_width), floor(y/obj_grid.cell_height), floor(obj_player.x/obj_grid.cell_height), floor(obj_player.y/obj_grid.cell_height));
}