
var move = side;

hsp = move * walksp;

//Horizontal Collision
var wall_collision = instance_place(x+hsp,y,obj_collisionground);
if(wall_collision != noone){
	while(!place_meeting(x+sign(hsp),y,obj_collisionground)){
		x += sign(hsp);
	}
	
	if(wall_collision.bbox_top > bbox_top) and (place_meeting(x,y+1,obj_collisionground)){
		var floor_y = y;
		while(bbox_bottom >= wall_collision.bbox_top){
			y--
		}
		y--
		if(place_meeting(x+sign(hsp),y,obj_collisionground)) y = floor_y;
	}
	
hsp = 0;	
}

x += hsp;

vsp += grv;

//Vertical Collision
if(place_meeting(x,y+vsp,obj_collisionground)){
	vsp = 0;
}

if(vsp > 0 and place_meeting(x,y+vsp,obj_collisionplataform) and !place_meeting(x,y,obj_collisionplataform)){
	vsp = 0;
}

y += vsp; 