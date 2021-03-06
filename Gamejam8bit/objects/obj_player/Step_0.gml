if(cutscene){
	hsp = 0;
}else{

// Player Input
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_up = keyboard_check_pressed(vk_up);
key_down = keyboard_check(vk_down);

//Movement Calculation
var move = (key_right - key_left) * 4;

hsp = move * walksp;

if(move != 0){
	view_side = sign(move);
	running = 1.25;
}else{ running = 1;}
}

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
		if(place_meeting(x+sign(hsp),y,obj_collisionground)){y = floor_y; hsp = 0;}
	}else{
		hsp = 0;	
	}
	

}

x += hsp;

vsp += grv;

if(!place_meeting(x,y+1,obj_collisionground) and !place_meeting(x,y+1,obj_collisionplataform)){
	var i = 1;
	var ground = instance_position(x,y+i,obj_collisionground)
	var plataform = instance_position(x,y+i,obj_collisionplataform);
	while(ground == noone and plataform == noone){
		i++
		var ground = instance_position(x,y+i,obj_collisionground)
		var plataform = instance_position(x,y+i,obj_collisionplataform);
		if(y+i > room_height){
			break;
		}
	}
	if(ground != noone){
		location_x = ground.x+ground.sprite_width/2;;
		location_y = ground.y-ground.sprite_height/2;
	}
	if(plataform != noone){
		location_x = plataform.x+plataform.sprite_width/2;;
		location_y = plataform.y-plataform.sprite_height/2;
	}
}else{location_y = y;location_x = x;}

if(place_meeting(x,y,obj_collisionplataform)){
	var i = 1;
	var ground = instance_position(x,y+i,obj_collisionground)
	while(ground == noone){
		i++
		var ground = instance_position(x,y+i,obj_collisionground)
		if(y+i > room_height){
			break;
		}
	}
		location_x = ground.x+ground.sprite_width/2;
		location_y = ground.y-ground.sprite_height/2;
}

//Vertical Collision
if(place_meeting(x,y+vsp,obj_collisionground)){
	vsp = key_up * -5;
}

if(vsp > 0 and place_meeting(x,y+vsp,obj_collisionplataform) and !place_meeting(x,y,obj_collisionplataform) and !key_down){
	vsp = key_up * -5;
}

y += vsp; 
