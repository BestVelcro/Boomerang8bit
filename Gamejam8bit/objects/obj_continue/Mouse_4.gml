if(file_exists("savelevel.save")){
	var _buffer = buffer_load("savelevel.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	
	var _loadLevel = array_pop(_loadData);
	
	global.level = _loadLevel.last_level;
}
if(variable_global_exists("level")){
room_goto(global.level);
}else{
	room_goto(Room1);	
}
