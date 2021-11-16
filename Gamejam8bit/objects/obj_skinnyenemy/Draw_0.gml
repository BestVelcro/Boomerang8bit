draw_self();
	draw_set_colour(c_white);
draw_text(x,y-20-(sprite_height/2),string(action)+" action");
draw_text(x,y-30-(sprite_height/2),string(side)+" side");
if(instance_exists(obj_player)){
	if(distance_to_object(obj_player) < room_width/2 and collision_line(x,y,obj_player.x,obj_player.y,obj_collisionground,false,false) == noone) draw_set_colour(c_red);
	draw_line(x,y,obj_player.x,obj_player.y);
	draw_text(x,y-40-(sprite_height/2),string(distance_to_object(obj_player)));
	
}
if(instance_exists(best_stair)) draw_circle(best_stair.x,best_stair.y,20,false);