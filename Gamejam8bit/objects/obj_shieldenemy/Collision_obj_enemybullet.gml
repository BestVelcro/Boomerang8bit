if(state != "VULNERABLE" and other.allied){
		var hitside = sign(obj_boomerang.x - x);
		image_xscale = hitside;
		image_index = 1; image_speed = 1;
		knockback_power = knockback_maxpower;
		knockback_side = sign(x - obj_boomerang.x);
}else if(other.allied){
instance_destroy(other);
EnemyParticles(200,-20,other,self);
instance_destroy();
}