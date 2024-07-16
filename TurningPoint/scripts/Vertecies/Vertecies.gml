// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vertex_add_point(_vbuff, _x, _y, _z, _nx, _ny, _nz, _u, _v, _color, _alpha){
	vertex_position_3d(_vbuff, _x, _y, _z);
	vertex_normal(_vbuff, _nx,_ny,_nz);
	vertex_texcoord(_vbuff, _u, _v);
	vertex_color(_vbuff, _color, _alpha);
}

function import_obj(_file_name, _vertex_format){
	var _buffer = buffer_load(_file_name);
	var _content_string = buffer_read(_buffer, buffer_text);
	buffer_delete(_buffer);
	var _lines = string_split(_content_string, "\n");
	var _vb = vertex_create_buffer();
	vertex_begin(_vb, _vertex_format);
	var _positions = [];
	var _texcoords = [];
	var _normals = [];
	for(var _i = 0; _i < array_length(_lines); _i++){
		var _this_line = _lines[_i];
		if(_this_line == "") continue;
		var _tokens = string_split(_this_line, " ");
		switch(_tokens[0]){
			case "v":
				var _vx = real(_tokens[1]);
				var _vy = real(_tokens[2]);
				var _vz = real(_tokens[3]);
				array_push(_positions, {x: _vx, y: _vz, z: _vy});
				break;
			case "vt":
				var _u = real(_tokens[1]);
				var _v = real(_tokens[2]);
				array_push(_texcoords, {x: _u, y: 1 - _v});
				break;
			case "vn":
				var _nx = real(_tokens[1]);
				var _ny = real(_tokens[2]);
				var _nz = real(_tokens[3]);
				array_push(_normals, {x: _nx, y: _nz, z: _ny});
				break;
			case "f":
				for (var _j = 2; _j < array_length(_tokens); _j++){
					var _v1 = _tokens[1];
					var _v2 = _tokens[_j-1];
					var _v3 = _tokens[_j];
				
					var _v1_tokens = string_split(_v1, "/");
					var _v2_tokens = string_split(_v2, "/");
					var _v3_tokens = string_split(_v3, "/");
					
					var _v1_position = _positions[real(_v1_tokens[0]) - 1];
					var _v1_textcoord = _texcoords[real(_v1_tokens[1]) - 1];
					var _v1_normal = _normals[real(_v1_tokens[2]) - 1];
					
					var _v2_position = _positions[real(_v2_tokens[0]) - 1];
					var _v2_textcoord = _texcoords[real(_v2_tokens[1]) - 1];
					var _v2_normal = _normals[real(_v2_tokens[2]) - 1];
					
					var _v3_position = _positions[real(_v3_tokens[0]) - 1];
					var _v3_textcoord = _texcoords[real(_v3_tokens[1]) - 1];
					var _v3_normal = _normals[real(_v3_tokens[2]) - 1];
					
					switch(array_length(_v1_tokens)){
						case 1:
							_v1_textcoord = {x: 0, y: 0};
							_v1_normal = {x: 0, y: 0, z: 0};
							break;
						case 2:
							_v1_normal = {x: 0, y:0, z:0};
							break;
						case 3:
							if(_v1_tokens[1] = "") _v1_textcoord = {x:0, y:0};
							break;
					}
					switch(array_length(_v2_tokens)){
						case 1:
							_v2_textcoord = {x: 0, y: 0};
							_v2_normal = {x: 0, y: 0, z: 0};
							break;
						case 2:
							_v2_normal = {x: 0, y:0, z:0};
							break;
						case 3:
							if(_v2_tokens[1] = "") _v1_textcoord = {x:0, y:0};
							break;
					}
					switch(array_length(_v3_tokens)){
						case 1:
							_v3_textcoord = {x: 0, y: 0};
							_v3_normal = {x: 0, y: 0, z: 0};
							break;
						case 2:
							_v3_normal = {x: 0, y:0, z:0};
							break;
						case 3:
							if(_v3_tokens[1] = "") _v3_textcoord = {x:0, y:0};
							break;
					}
				
					vertex_position_3d(_vb, _v1_position.x, _v1_position.y, _v1_position.z);
					vertex_normal(_vb, _v1_normal.x, _v1_normal.y, _v1_normal.z);
					vertex_texcoord(_vb, _v1_textcoord.x, _v1_textcoord.y);
					vertex_color(_vb, c_white, 1);
				
					vertex_position_3d(_vb, _v2_position.x, _v2_position.y, _v2_position.z);
					vertex_normal(_vb, _v2_normal.x, _v2_normal.y, _v2_normal.z);
					vertex_texcoord(_vb, _v2_textcoord.x, _v2_textcoord.y);
					vertex_color(_vb, c_white, 1);
				
					vertex_position_3d(_vb, _v3_position.x, _v3_position.y, _v3_position.z);
					vertex_normal(_vb, _v3_normal.x, _v3_normal.y, _v3_normal.z);
					vertex_texcoord(_vb, _v3_textcoord.x, _v3_textcoord.y);
					vertex_color(_vb, c_white, 1);
				}
				break;
		}
	}
	
	vertex_end(_vb);
	vertex_freeze(_vb);
	return _vb;
}