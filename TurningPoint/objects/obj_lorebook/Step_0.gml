/// @description Insert description here
// You can write your code in this editor
hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
if(hover > array_length(struct_get_names(path))-1){
	hover = 0;
}
if(hover < 0){
	hover = array_length(struct_get_names(path))-1;
}
if(keyboard_check_pressed(ord("Z"))){
	switch level{
		case CATEGORY.A:
			level = CATEGORY.B;
			if(hover = 0) path = lore.Character1.Lyraka;
			if(hover = 1) path = lore.Character1.Baxter;
			if(hover = 2) path = lore.Character1.Donohue;
			if(hover = 3) path = lore.Character1.Shelly;
			//if(hover = 4) path = lore.Character1.Nac;
			break;
		case CATEGORY.B:
			break;
	}
}
if(keyboard_check_pressed(ord("X"))){
	hover = 0;
	switch level{
		case CATEGORY.B:
			level = CATEGORY.A;
			path = lore.Character1
			break;
		case CATEGORY.A:
			instance_destroy()
			break;
	}
}