
if(instance_exists(obj_boomerang)){
	if(!other.allied){
	if(!obj_boomerang.iframe){
audio_play_sound(choose(PlayerDie1,PlayerDie2,PlayerDie3),1100,false);
instance_destroy(other);
var times = 16;
var angle = 360/times;
var current_angle = 0;
repeat(times){
	var particle = instance_create_layer(x,y,"HUD",obj_playerdeath);
	particle.speed = 1.5;
	particle.direction = current_angle;
	current_angle += angle;
}
angle = 360/(times/2)
current_angle = 0;
repeat(times/2){
	var particle = instance_create_layer(x,y,"HUD",obj_playerdeath);
	particle.speed = 1;
	particle.image_speed = 0.5;
	particle.direction = current_angle;
	current_angle += angle;
}
EnemyParticles(75,-10,other,self);
instance_destroy();
	}
	}
}
