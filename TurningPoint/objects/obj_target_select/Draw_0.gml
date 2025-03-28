/// @description Insert description here
// You can write your code in this editor

if(m_target_side[char_index].hp > 0){
	draw_self();
	draw_set_font(fnt_ds);
	draw_text(x+4,y+2,string(m_target_side[char_index].name));
}

