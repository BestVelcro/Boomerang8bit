// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collision(){
//Collision horizontal with object Collision
var wall_collision = instance_place(x+speed_h,y,obj_collisionground);
if(wall_collision != noone){
	while(!place_meeting(x+sign(speed_h),y,obj_collisionground)){
		x += sign(speed_h);
		}
		if(state != "IDLE"){
	show_debug_message("collision"+string(irandom(20)));
	if(wall_collision.bbox_top > bbox_top) and (place_meeting(x,y+1,obj_collisionground)){	
		var floor_y = y;
		while(bbox_bottom >= wall_collision.bbox_top){
			y--
		}
		y--
		if(place_meeting(x+sign(speed_h),y,obj_collisionground)){ y = floor_y; speed_h = 0;
			}
	}else if(wall_collision.bbox_top > bbox_top) and (!place_meeting(x,y+1,obj_collisionground)){
		speed_h = 0;
	}
		}else{
			speed_h = 0;
			}
}

if(object_index == obj_shieldenemy and place_meeting(x+knockback_move,y,obj_collisionground)){
	knockback_move = 0;
}

x += speed_h;
if(object_index == obj_shieldenemy){
	x += knockback_move;
}

// Collision vertical with object Collision

if(place_meeting(x,y+speed_v,obj_collisionground)){
	while !place_meeting(x, y+sign(speed_v), obj_collisionground) {
        y += sign(speed_v);
    }
	speed_v = 0;
}

if(speed_v > 0 and place_meeting(x,y+speed_v,obj_collisionplataform) and !place_meeting(x,y,obj_collisionplataform) and !falling){
	while !place_meeting(x, y+sign(speed_v), obj_collisionplataform) {
        y += sign(speed_v);
    }
	speed_v = 0;
}

y += speed_v;
}