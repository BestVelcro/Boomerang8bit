 hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 1;
default_walksp = walksp;
side = 0 //choose(-1,1);
state = "IDLE";
fall_side = 1;
action = false;

stop = false;

goto_x = 0;
goto_y = 0;

previous_floor = noone;
current_floor = noone;

descending = false;

closest_stair = 9999;
best_stair = noone;

newsound = false;

last_y = y;

last_seen_x = 0;
last_seen_y = 0;
saw_player = false;

spawn_x = x;
spawn_y = y;

place_seen = false;
out_of_sight = true;

fall = false;

callhit = false;
knockback_power = 0;
knockback_move = 0;
knockback_maxpower = 4;
knockback_side = 1;
image_speed = 0;