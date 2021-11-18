repeat(5){
		var particle = instance_create_layer(x,y,"Weapon",obj_wallparticle);
		particle.speed = speed/2;
		particle.direction = (direction-irandom_range(-45,45))-180
}
instance_destroy();