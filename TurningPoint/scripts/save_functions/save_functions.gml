// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.game_data = {
	room_data: { }
}

function save_game(){
	save_room();
	var _string = json_stringify(global.game_data);
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "save.txt");
	buffer_delete(_buffer);
}
	
function save_room(){
	var _array = [];
	with (obj_player) {
		var _struct = {
			object: object_get_name(object_index),
			x: x,
			y: y,
			image_index: image_index
		};
		array_push(_array, _struct);
	}
	with (obj_Game) {
		var _struct = {
			x:x,
			y:y,
			object: object_get_name(object_index),
			//global.party: global.party
		};
		array_push(_array, _struct);
	}
	struct_set(global.game_data.room_data, room_get_name(room), _array);
}

function load_game(){
	if(file_exists("save.txt")){
		var _buffer = buffer_load("save.txt");
		var _json = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		global.game_data = json_parse(_json);
		load_room();
		
	}
}
	
function load_room(){
	var _array = struct_get(global.game_data.room_data, room_get_name(room));
	if(_array != undefined){
		instance_destroy(obj_Game);
		instance_destroy(obj_player);
		for (var _i = 0; _i < array_length(_array); _i ++){
			var _struct = _array[_i];
			instance_create_layer(_struct.x,_struct.y, "Instances", asset_get_index(_struct.object), _struct);
		}
	}
}