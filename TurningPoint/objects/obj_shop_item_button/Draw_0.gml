/// @description Insert description here
// You can write your code in this editor
switch obj_SHOP.shop_state{
	case SHOPSTATE.BUY:
		draw_self();
		draw_set_font(fnt_ds);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		text_display(1, x + 2, y+2, item_ID.name);
		draw_set_halign(fa_right);
		text_display(1, x+sprite_width-2, y+2, item_ID.price);
		break;
	case SHOPSTATE.SELL:
		draw_self();
		draw_set_font(fnt_ds);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		text_display(1, x + 2, y+2, item_ID.name);
		draw_set_halign(fa_right);
		text_display(1, x+sprite_width-2, y+2, string(inv_count));
		break;
}
