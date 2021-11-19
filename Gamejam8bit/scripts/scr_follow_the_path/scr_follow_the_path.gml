// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_follow_the_path(path_id){
var number_of_points = path_get_number(path_id);
var path_direction ;

path_direction = sign(path_get_point_x(path_id, path_point+1)-path_get_point_x(path_id, path_point)) ;

if action == 0
{
    /// Check if the next point is to move left or right
    if path_get_point_y(path_id, path_point) == path_get_point_y(path_id, path_point+1) && path_get_point_x(path_id, path_point) + obj_grid.cell_width*path_direction == path_get_point_x(path_id, path_point+1)
    {
    speed_h = max_speed * path_direction ;
    action = 1;
    }
     else {
            /// Check if the next point is horizontal jump / jump over a void.
            if path_get_point_y(path_id, path_point) == path_get_point_y(path_id, path_point+1) && path_get_point_x(path_id, path_point) + 2*obj_grid.cell_width*path_direction == path_get_point_x(path_id, path_point+1)
            {
            speed_h = max_speed * path_direction ;
            // speed_v = jump_height *0.7 ;
            action = 1;
            }
                else {
                    /// Check if the next point is to fall
                    if path_get_point_y(path_id, path_point) < path_get_point_y(path_id, path_point+1)
                    {
                    speed_h = max_speed * path_direction ;
                        if x <= path_get_point_x(path_id, path_point+1) && path_get_point_x(path_id, path_point+1) <(x + speed_h*path_direction)
                        {
                        action = 1 ;
                        speed_h = 0 ;
						falling = true;
                        x = path_get_point_x(path_id, path_point+1);
                        }
                    }
                        else {
                                /// Check if the next point is a diagonal jum /big jump
                                if path_get_point_x(path_id, path_point) == path_get_point_x(path_id, path_point+1)-obj_grid.cell_width*2*path_direction && path_get_point_y(path_id, path_point) == path_get_point_y(path_id, path_point+1)+obj_grid.cell_height
                                {
                                speed_h = max_speed * path_direction;
                                // speed_v = jump_height * 1.1 ;
                                action = 1;
                                }
                                    else {
                                            /// Check if the next point is a jump one block vertically
                                            if path_get_point_y(path_id, path_point) == path_get_point_y(path_id, path_point+1)+obj_grid.cell_height && path_get_point_x(path_id, path_point) + obj_grid.cell_width*path_direction == path_get_point_x(path_id, path_point+1)
                                            {
                                            speed_h = max_speed * path_direction;
                                                if place_meeting(x, y+1, obj_collisionground) && jump_action == 0
                                                {
                                                // speed_v = jump_height * 0.9 ;
                                                jump_action = 1 ;
                                                speed_h = max_speed * path_direction ;
                                                }
                                }
                            }
                        }
                    }
        }
}

/// Check if enemy reached the next point
if x <= path_get_point_x(path_id, path_point+1) && path_get_point_x(path_id, path_point+1) <= x + speed_h*path_direction && path_get_point_y(path_id, path_point+1)== y - sprite_yoffset - (obj_grid.cell_height/2 - sprite_height)
    {
    path_point = path_point + 1 ;
    action = 0 ;
    jump_action = 0 ;
        if path_point == number_of_points -1  /// Check if it is the last point of the path
            {
            speed_h = 0;
            speed_v = 0;
            path_delete (path_id);
            path_point = 0 ;
            }
    }
}