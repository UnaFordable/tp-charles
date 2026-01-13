randomise()
text_prompt = "Choose a path ..."

/*
Path_ID: 0 means no path selected, 1 means basic enemy, 2 means mini boss, 3 means boss, 4 means rest, 5 means shop, 6 means gamble
*/
path_ID = 0;

function rougelike_state_select_path(){
	/*
		This function destroy previous path buttons and creates new ones with new set paths
	*/
	if(!instance_exists(obj_button_universal)){
		instance_create_depth(85, -48, depth, obj_button_universal,
		{image_xscale: 3, image_yscale:1.5, name: "GO!", 
			button_func : function(){ with(obj_rglk_path_button)instance_destroy(); 
									  obj_ROUGELIKE.rougelike_state = obj_ROUGELIKE.rougelike_state_select_path; }});
	}
	
	if!instance_exists(obj_rglk_path_button){
		instance_create_depth(32, -104, depth ,obj_rglk_path_button, {assigned_path : choose(PATH.BASICENEMY, PATH.SHOP, PATH.REST,PATH.GAMBLE)});
		instance_create_depth(120, -136, depth ,obj_rglk_path_button, {assigned_path : choose(PATH.BASICENEMY, PATH.SHOP, PATH.REST,PATH.GAMBLE)});
		instance_create_depth(200, -104, depth ,obj_rglk_path_button, {assigned_path : choose(PATH.BASICENEMY, PATH.SHOP, PATH.REST,PATH.GAMBLE)});
	}
}

function rougelike_state_begin(){
	/*
		Initialize the rougelike sequence
		Do some actions before the rougelike loop begins
	*/
	rougelike_state = rougelike_state_select_path;
}
rougelike_state = rougelike_state_begin;