// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyParticles(amount, max_distance){
			var up_maxdistance = max_distance,
			up_currentmax = up_maxdistance/2,
			up_distance = 0, side_distance = 0,
			rising = true, wave_size = up_maxdistance*3, force = random_range(0.5,1.5);
			repeat(amount){
			var particle = instance_create_layer(x,y,"Weapon",obj_enemyparticle);
				particle.hsp = sign(other.hsp*-1)*side_distance;
				particle.vsp = up_distance;
				particle.direction = direction-irandom_range(-45,45)-180;
				particle.image_index = irandom(particle.image_number-1);
				particle.image_xscale = sign(other.hsp*-1);
				if(up_distance > up_currentmax){
					up_distance--; 
				}else{
					up_distance = 0; side_distance += force;
					if(rising) up_currentmax--; else up_currentmax++;
				};
				if(up_currentmax <= up_maxdistance and rising){
					if(wave_size < 0){
						up_currentmax = up_maxdistance;
						wave_size++;
					}else{ rising = false;}
				}
			}
}