if(instance_exists(obj_camera)){
	teleportbar_x = obj_camera.view_width - sprite_get_width(spr_teleportborder) - (room_width/64);
	teleportbar_y = obj_camera.view_height - sprite_get_height(spr_teleportbar) - (room_height/64);
}

if(room != Level1){
draw_sprite_stretched(spr_teleportbar,0,teleportbar_x,teleportbar_y,(cooldown/maxcooldown) * teleportbar_width, teleportbar_height);
draw_sprite(spr_teleportborder,0,teleportbar_x,teleportbar_y);
}