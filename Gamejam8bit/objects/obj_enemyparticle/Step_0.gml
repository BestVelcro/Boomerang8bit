
//Horizontal Collision
var wall_collision = place_meeting(x+hsp,y,obj_collisionground);
if(wall_collision){
instance_destroy();	
}

x += hsp;

vsp += grv;
if(hsp > 0) hsp -= grv;if(hsp < 0) hsp += grv;

//Vertical Collision
if(place_meeting(x,y+vsp,obj_collisionground)){
	instance_destroy();
}


y += vsp; 

show_debug_message(string(hsp));