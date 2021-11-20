// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_call_pathfinding(goto_x,goto_y){
     /// Reset all variable when we build a new path because enemy might be in path when we press S
     speed_h = 0;
     speed_v = 0;
     if path_exists(path_building) {
         path_delete (path_building);
     }
     path_point = 0 ;
     action = 0 ;
     jump_action = 0 ;

    scr_fill_the_grid(floor(x/obj_grid.cell_width), floor(y/obj_grid.cell_height), floor(goto_x/obj_grid.cell_width), floor(goto_y/obj_grid.cell_height));
}