/// @description Insert description here
// You can write your code in this editor
switch shop_state {
	case SHOPSTATE.BUY:
		text_display(1, 80, 64, "Hello");
		break;
	case SHOPSTATE.SELL:
		text_display(1, 80, 64, "Goodbye");
		break;
}
draw_text(x,y,test);