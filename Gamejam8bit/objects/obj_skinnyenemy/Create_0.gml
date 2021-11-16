 hsp = 0;
vsp = 0;
grv = 0.5;
walksp = 1;
default_walksp = walksp;
side = 0 //choose(-1,1);
state = "IDLE";
fall_side = 1;
action = false;

goto_x = 0;
goto_y = 0;

previous_floor = noone;
current_floor = noone;

descending = false;

closest_stair = 9999;
best_stair = noone;

newsound = false;

last_y = y;