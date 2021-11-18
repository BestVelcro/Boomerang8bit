if(variable_global_exists("newLevel") and global.newLevel == true){
	global.newLevel = false;
	global.level = room;
	
	var _saveData = array_create(0);
	
	var _saveLevel = {
		last_level: global.level
	}
	array_push(_saveData, _saveLevel);
	
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "savelevel.save");
	buffer_delete(_buffer);
	show_debug_message("Game Saved " + _string);
}