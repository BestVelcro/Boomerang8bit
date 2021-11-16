draw_set_colour(c_white);
draw_self();
var length = string_width(string(hsp)+" hsp");
draw_text(x-length/2,y-25-(sprite_height/2),string(hsp)+" hsp");
var length = string_width(string(state));
draw_text(x-length/2,y-40-(sprite_height/2),string(state));
/*
if(instance_exists(obj_player)){
	if(distance_to_object(obj_player) < room_width/2 and collision_line(x,y,obj_player.x,obj_player.y,obj_collisionground,false,false) == noone) draw_set_colour(c_red);
	draw_line(x,y,obj_player.x,obj_player.y);
	draw_text(x,y-40-(sprite_height/2),string(distance_to_object(obj_player)));
}
*/
if(instance_exists(best_stair)){
	draw_line_width(x,y,best_stair.x,best_stair.y, 2);
}

draw_set_colour(c_red);
draw_arrow(goto_x,goto_y-40,goto_x,goto_y,30)