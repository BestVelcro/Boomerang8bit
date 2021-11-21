/// Initialize variables for ennemy movement
max_speed = 2;
game_gravity = 1;
// jump_height = -10;
speed_v = 0 ;
speed_h = 0;

near = instance_nearest(x,y,obj_gotoplace);
speed_h = max_speed * sign(near.x - x);