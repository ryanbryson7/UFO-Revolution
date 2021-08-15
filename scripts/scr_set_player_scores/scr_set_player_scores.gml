function set_player_scores_and_health(){
	if (instance_exists(obj_player_one)) {
		obj_player_one.playerHealth = min(playerOneHealth, obj_player_one.playerHealth);
		playerOneHealth = obj_player_one.playerHealth;	
		obj_player_one.playerScore = max(playerOneScore, obj_player_one.playerScore);
		playerOneScore = obj_player_one.playerScore;
	}

	if (instance_exists(obj_player_two)) {
		obj_player_two.playerHealth = min(playerTwoHealth, obj_player_two.playerHealth);
		playerTwoHealth = obj_player_two.playerHealth;	
		obj_player_two.playerScore = max(playerTwoScore, obj_player_two.playerScore);
		playerTwoScore = obj_player_two.playerScore;
	}
	
	if (playerOneHealth <= 0) {
		instance_destroy(obj_player_one);	
	}
	if (playerTwoHealth <= 0) {
		instance_destroy(obj_player_two);	
	}
}