new_enemy = false;
count = 0;
start = false;
image_speed = 0;
near = instance_nearest(x,y,obj_gotoplace);
image_xscale = sign(near.x - x);
random_start = false;
go = false;