

switch room {
	case room_intro: {
		if (keyboard_check_pressed(vk_space)) {
			room_goto(room_main);
		}
		if (keyboard_check_pressed(vk_shift)) {
			var lay_id = layer_get_id("Background");
			var back_id = layer_background_get_id(lay_id);
			layer_background_index(back_id, 1);
			twoPlayerGame = true;
		}
		
		
		break;	
	}
		
	case room_main: {
		// Get list of alien instances
		// If list is empty, generate (AKA restart) the room
		if (!instance_exists(obj_par_alien)) {
			room_restart();	
		}
		
		set_player_scores_and_health();
		
		if (playerOneHealth <= 0) {
			if (!twoPlayerGame || twoPlayerGame && playerTwoHealth <= 0) {
				room_goto(room_gameover);	
			}	
		}
		
		break;
	}
	case room_gameover: {
		if (keyboard_check_pressed(vk_space)) {
			twoPlayerGame = false;
			room_goto(room_intro);
		}
		
		break;	
	}
	
	
}