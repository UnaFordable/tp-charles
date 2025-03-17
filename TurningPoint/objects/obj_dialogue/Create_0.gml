//instance_deactivate_all(true);
text_set = {text: "", name: ""};
pendingnum =  0;
display_num = 0;
text_box = spr_text_box;
text_box_s = spr_text_box_s;

display_delay = 0;

all_text_displayed = false;
enum DISPLAY{
	NORMAL,
	LEGEND,
	PLAIN,
	OVERHEAD
}
display_state = noone;

next_step = false;