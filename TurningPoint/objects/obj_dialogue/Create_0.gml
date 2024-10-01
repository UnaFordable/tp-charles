//instance_deactivate_all(true);
text_set = [{text: "", name: ""},{text: "", name: ""}];
text_to_display = 0;
text_box = spr_text_box;
text_box_s = spr_text_box_s;
enum DISPLAY{
	NORMAL,
	LEGEND,
	PLAIN,
	OVERHEAD
}
display_state = DISPLAY.NORMAL
instance_create_depth(global.cam_top_x, global.cam_top_y+156,-99998, obj_filmbackground);
