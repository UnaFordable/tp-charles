/// @description Insert description here
// You can write your code in this editor
with(obj_battle_menu){
	instance_destroy();
}
var _cursor = obj_battle.cursor;
if(_cursor.target_all =0) _cursor.active_target = m_target_side[char_index];
if(m_target_side == obj_battle.enemy_units){
	with(_cursor) target_side = array_filter(target_side, function(_element, _index){return _element.hp>0});
}
with(obj_battle){
	
	begin_action(cursor.active_user, cursor.active_action, cursor.active_target);
}
	obj_battle.active = false;
	obj_battle.confirm_delay = 0;

				