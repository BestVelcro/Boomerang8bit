locked = true;
hsp = 0;
vsp = 0;
bspeed = 1;
throw_start = false;
throw_power = 15;
throw_side = 0;
returning = false;
safetp = false;
tpoffset = sprite_height/2;
hitCount = 0;
acceleration_x = 0;
acceleration_y = 0;
x_stop = false;
y_stop = false;

cutscene = false;

iframe = false;

//Teleport bar
maxcooldown = 100;
cooldown = maxcooldown;

teleportbar_width = 100;
teleportbar_height = 14;
teleportbar_x = room_width/2//room_width - sprite_get_width(spr_teleportborder) - (room_width/64);
teleportbar_y = room_height/2//room_height - sprite_get_height(spr_teleportbar) - (room_height/64);

alarm[0] = room_speed/2;