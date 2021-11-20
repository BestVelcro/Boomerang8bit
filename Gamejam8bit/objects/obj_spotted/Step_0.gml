if(owner != noone){
if(instance_exists(owner)){
x = owner.x;
y = owner.y-owner.sprite_height/2-4;
}else{
	instance_destroy();
}
}