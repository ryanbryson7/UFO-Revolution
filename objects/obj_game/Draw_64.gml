switch(room) {
	case room_main: {
		draw_set_valign(fa_left);
		// Draw Player One's GUI
		draw_set_halign(fa_left);
		var _color = c_black;
		draw_text_transformed_color(10, 10, "SCORE:" + string(playerOneScore), 1, 1, 0, _color, _color, _color, _color, 1);
		draw_sprite(spr_health, playerOneHealth, 10, 30);
		
		// Draw Player Two's GUI (if they are playing)
		if (twoPlayerGame) {
			draw_set_halign(fa_left);
			var _color = c_black;
			draw_text_transformed_color(500, 10, "SCORE: " + string(playerTwoScore), 1, 1, 0, _color, _color, _color, _color, 1);
			draw_sprite(spr_health, playerTwoHealth, 500, 30);
		}
		
		// Draw High Score
		draw_set_halign(fa_center);
		var _color = c_black;
		highScore = max(playerOneScore, playerTwoScore, highScore);
		draw_text_transformed_color(320, 10, "HIGHSCORE: \n" + string(highScore), 1.2, 1.2, 0, _color, _color, _color, _color, 1);
			
		break;	
	}
	case room_intro: {
		
		break;
	}
	case room_gameover: {		
		draw_set_valign(fa_left);
		// Draw Player One's GUI
		draw_set_halign(fa_left);
		var _color = c_black;
		draw_text_transformed_color(10, 10, "SCORE:" + string(playerOneScore), 1, 1, 0, _color, _color, _color, _color, 1);
		draw_sprite(spr_health, playerOneHealth, 10, 30);
		
		// Draw Player Two's GUI (if they are playing)
		if (twoPlayerGame) {
			draw_set_halign(fa_left);
			var _color = c_black;
			draw_text_transformed_color(500, 10, "SCORE: " + string(playerTwoScore), 1, 1, 0, _color, _color, _color, _color, 1);
			draw_sprite(spr_health, playerTwoHealth, 500, 30);
		}
		
		// Draw High Score
		draw_set_halign(fa_center);
		var _color = c_black;
		highScore = max(playerOneScore, playerTwoScore, highScore);
		draw_text_transformed_color(320, 10, "HIGHSCORE: \n" + string(highScore), 1.2, 1.2, 0, _color, _color, _color, _color, 1);
		
		// Draw Gameover Message
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		var _color = c_black;
		draw_text_transformed_color(room_width / 2, room_height / 2, "GAME OVER", 2, 2, 0, _color, _color, _color, _color, 1);
		draw_text_transformed_color(room_width / 2, room_height / 2 + 40, "PRESS 'SPACE' TO RESTART", 1.5, 1.5, 0, _color, _color, _color, _color, 1);
	}
}