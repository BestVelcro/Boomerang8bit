// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fill_the_grid(start_x,start_y,go_x,go_y){
var ax = start_x;
var ay = start_y;
var xgoal = go_x;
var ygoal = go_y;
var path_found = 0; // A path was found
var n; // Variable when you fall
var a; // Variable when you fall

//Copy the global finding
ds_gridpathfinding = ds_grid_create(ds_grid_width(global.ds_grid_pathfinding), ds_grid_height(global.ds_grid_pathfinding));
ds_grid_copy(ds_gridpathfinding, global.ds_grid_pathfinding);

var point_list = ds_list_create();
ds_list_add(point_list, ax);
ds_list_add(point_list, ay);
ds_grid_set(ds_gridpathfinding,ax,ay,0);

for (var i = 1; i < 200; i += 1){
	if(path_found = 1){
		ds_list_destroy(point_list);
		ds_grid_destroy(ds_gridpathfinding);
		return path_found;
		break;
	}
	
	var size_list = ds_list_size(point_list);
	
	if(size_list == 0){
		ds_list_destroy(point_list);
		ds_grid_destroy(ds_gridpathfinding);
		return path_found;
		break;
	}
	
	for(var j = 0; j < size_list; j += 2){
		ax = ds_list_find_value(point_list, j)
		ay = ds_list_find_value(point_list, j+1)
		
		if ax == xgoal and ay == ygoal{
			path_found = 1;
			scr_build_the_path(xgoal,ygoal);
			break;
		}
		
	n = 1;
	
// Check if Enemy can go to the right

if(ds_grid_get(ds_gridpathfinding,ax,ay + 1) == -3 and ds_grid_get(ds_gridpathfinding,ax, ay + 2) == -2){
	ds_grid_set(ds_gridpathfinding,ax, ay + 1, i);
	ds_list_add(point_list, ax);
	ds_list_add(point_list, ay + 1);
}

if(ds_grid_get(ds_gridpathfinding,ax + 1,ay) == -1 and ds_grid_get(ds_gridpathfinding,ax + 1, ay + 1) == -2){
	ds_grid_set(ds_gridpathfinding,ax + 1, ay, i);
	ds_list_add(point_list, ax + 1);
	ds_list_add(point_list, ay);
}

if(ds_grid_get(ds_gridpathfinding,ax + 1,ay) == -1 and ds_grid_get(ds_gridpathfinding,ax + 2,ay) == -1 and ds_grid_get(ds_gridpathfinding, ax+1,ay+1) > 0 and ds_grid_get(ds_gridpathfinding, ax+2,ay+1) == -3){
	ds_grid_set(ds_gridpathfinding,ax + 1, ay, i);
	ds_list_add(point_list, ax + 1);
	ds_list_add(point_list, ay);
} 
	
if(ds_grid_get(ds_gridpathfinding,ax + 1,ay) == -1 and ds_grid_get(ds_gridpathfinding, ax+1,ay+1) == -3){
	ds_grid_set(ds_gridpathfinding,ax + 1, ay, i);
	ds_list_add(point_list, ax + 1);
	ds_list_add(point_list, ay);
} 

if(ds_grid_get(ds_gridpathfinding,ax + 1,ay) == -3 and ds_grid_get(ds_gridpathfinding, ax + 1, ay + 1) == -1){
	ds_grid_set(ds_gridpathfinding,ax + 1, ay + 1, i);
	ds_list_add(point_list, ax + 1);
	ds_list_add(point_list, ay + 1);
} 
	
if(ds_grid_get(ds_gridpathfinding,ax + 1,ay) == -2 and ds_grid_get(ds_gridpathfinding,ax + 1, ay - 1) == -1){
	ds_grid_set(ds_gridpathfinding,ax + 1, ay - 1, i);
	ds_list_add(point_list, ax + 1);
	ds_list_add(point_list, ay - 1);
}
	
if(ds_grid_get(ds_gridpathfinding,ax + 1,ay) == -2 and ds_grid_get(ds_gridpathfinding,ax + 1, ay - 1) == -3){
	ds_grid_set(ds_gridpathfinding,ax + 1, ay - 1, i);
	ds_list_add(point_list, ax + 1);
	ds_list_add(point_list, ay - 1);
} 
	
	if(ds_grid_get(ds_gridpathfinding, ax + 1, ay) == -1 and ds_grid_get(ds_gridpathfinding, ax + 1, ay + 1) == -1){
		{
			do
				{
					n = n + 1;
					a = ds_grid_get(ds_gridpathfinding, ax + 1, ay + n);
				}
				until (a == -2) || (ay + n == ds_grid_height(ds_gridpathfinding)) }
				
				if(ds_grid_get(ds_gridpathfinding,ax + 1, ay + n - 1) == -1 and ds_grid_get(ds_gridpathfinding, ax + 1, ay + n) == -2){
					ds_grid_set(ds_gridpathfinding, ax + 1, ay + n - 1, i);
					ds_list_add(point_list, ax + 1);
					ds_list_add(point_list, ay + n - 1);
				}
	}

n = 1;
		
if(ds_grid_get(ds_gridpathfinding,ax - 1,ay) == -1 and ds_grid_get(ds_gridpathfinding,ax - 1, ay + 1) == -2){
	ds_grid_set(ds_gridpathfinding,ax - 1, ay, i);
	ds_list_add(point_list, ax - 1);
	ds_list_add(point_list, ay);
}

if(ds_grid_get(ds_gridpathfinding,ax - 1,ay) == -1 and ds_grid_get(ds_gridpathfinding, ax-1,ay+1) == -3){
	ds_grid_set(ds_gridpathfinding,ax - 1, ay, i);
	ds_list_add(point_list, ax - 1);
	ds_list_add(point_list, ay);
} 

if(ds_grid_get(ds_gridpathfinding,ax - 1,ay) == -1 and ds_grid_get(ds_gridpathfinding,ax - 2,ay) == -1 and ds_grid_get(ds_gridpathfinding, ax-1,ay+1) > 0 and ds_grid_get(ds_gridpathfinding, ax-2,ay+1) == -3){
	ds_grid_set(ds_gridpathfinding,ax - 1, ay, i);
	ds_list_add(point_list, ax - 1);
	ds_list_add(point_list, ay);
} 

if(ds_grid_get(ds_gridpathfinding,ax - 1,ay) == -3 and ds_grid_get(ds_gridpathfinding, ax - 1, ay + 1) == -1){
	ds_grid_set(ds_gridpathfinding,ax - 1, ay + 1, i);
	ds_list_add(point_list, ax - 1);
	ds_list_add(point_list, ay + 1);
} 
	
if(ds_grid_get(ds_gridpathfinding,ax - 1,ay) == -2 and ds_grid_get(ds_gridpathfinding,ax - 1, ay - 1) == -1){
	ds_grid_set(ds_gridpathfinding,ax - 1, ay - 1, i);
	ds_list_add(point_list, ax - 1);
	ds_list_add(point_list, ay - 1);
} 
	
if(ds_grid_get(ds_gridpathfinding,ax - 1,ay) == -2 and ds_grid_get(ds_gridpathfinding,ax - 1, ay - 1) == -3){
	ds_grid_set(ds_gridpathfinding,ax - 1, ay - 1, i);
	ds_list_add(point_list, ax - 1);
	ds_list_add(point_list, ay - 1);
} 
	
	if(ds_grid_get(ds_gridpathfinding, ax - 1, ay) == -1 and ds_grid_get(ds_gridpathfinding, ax - 1, ay + 1) == -1){
		{
			do
				{
					n = n + 1;
					a = ds_grid_get(ds_gridpathfinding, ax - 1, ay + n);
				}
				until (a == -2) || (ay + n == ds_grid_height(ds_gridpathfinding)) }
				
				if(ds_grid_get(ds_gridpathfinding,ax - 1, ay + n - 1) == -1 and ds_grid_get(ds_gridpathfinding, ax - 1, ay + n) == -2){
					ds_grid_set(ds_gridpathfinding, ax - 1, ay + n - 1, i);
					ds_list_add(point_list, ax - 1);
					ds_list_add(point_list, ay + n - 1);
				}
	}
}

for(var k = 0; k < size_list; k += 1){
	ds_list_delete(point_list, 0);
}
	}
}