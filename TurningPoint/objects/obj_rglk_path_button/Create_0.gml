enum PATH {
	BASICENEMY,
	MINIBOSS,
	BOSS,
	REST,
	SHOP,
	GAMBLE
}

switch assigned_path {
	case PATH.BASICENEMY:
		image_index = 1;
		break;
	case PATH.MINIBOSS:
		image_index = 2;
		break;
	case PATH.BOSS:
		image_index = 3;
		break;
	case PATH.REST:
		image_index = 4;
		break;
	case PATH.SHOP:
		image_index = 5;
		break;
	case PATH.GAMBLE:
		image_index = 6;
		break;
}