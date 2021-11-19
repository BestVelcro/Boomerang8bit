if keyboard_check(ord("S"))
{
     /// Reset all variable when we build a new path because enemy might be in path when we press S
     speed_h = 0;
     speed_v = 0;
     if path_exists(path_building) {
         path_delete (path_building);
     }
     path_point = 0 ;
     action = 0 ;
     jump_action = 0 ;

    scr_fill_the_grid(floor(x/obj_grid.cell_width), floor(y/obj_grid.cell_height), floor(obj_player.x/obj_grid.cell_width), floor(obj_player.y/obj_grid.cell_height));
}

falling = false;
// Follow the path if path exists
if path_exists(path_building)
{
    scr_follow_the_path(path_building);
}


// Apply gravity
if !place_meeting (x, y+1, obj_collisionground)
    {
        speed_v = speed_v + game_gravity ;
    }

// Check if there is a collsiion
scr_collision () ;