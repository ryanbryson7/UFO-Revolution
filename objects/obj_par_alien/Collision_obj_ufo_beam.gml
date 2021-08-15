if (other.creatorTeam == team.player) {
	y -= abductedSpeed;
	if (bbox_top <= other.y) {
		// Alien is completely abducted
		//instance_destroy();
	}
}