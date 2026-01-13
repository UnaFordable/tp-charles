if instance_exists(obj_ROUGELIKE)
	switch assigned_path {
	case PATH.BASICENEMY:
		//new_encounter(global.troops[0], spr_battle_background_ui);
		with(obj_ROUGELIKE) text_prompt = "Battle enemy?";
		break;
	case PATH.MINIBOSS:
		with(obj_ROUGELIKE) text_prompt = "Batter strong enemy?";
		break;
	case PATH.BOSS:
		with(obj_ROUGELIKE) text_prompt = "Battle the Boss?";
		break;
	case PATH.REST:
		with(obj_ROUGELIKE) text_prompt = "Rest at camp?";
		break;
	case PATH.SHOP:
		with(obj_ROUGELIKE) text_prompt = "Stop by the shop?";
		break;
	case PATH.GAMBLE:
		with(obj_ROUGELIKE) text_prompt = "Take a gamble?";
		break;
	}