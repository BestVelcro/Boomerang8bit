

/// initialize variables in order to draw grid and the path
ds_gridpathfinding = noone ;
path_building = noone ;

/// Initialize variables for ennemy movement
max_speed = 1;
game_gravity = 1;
// jump_height = -10;
speed_v = 0 ;
speed_h = 0;

/// Intialialize variables for follow the path
action = 0 ;
path_point = 0 ;
jump_action = 0 ;
image_speed = 0;

falling = false;

collisions = false;
check_path = false;
saw_player = false;

state = "IDLE";
action = false;
waiting = false;
not_shot = true;
last_floor = noone;
change_floor = false;
callhit = false;

knockback_power = 0;
knockback_move = 0;
knockback_maxpower = 5;
knockback_side = 1;