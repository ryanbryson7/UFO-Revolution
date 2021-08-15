if (other.creatorTeam == team.enemy) {
	y -= abductedSpeed;
	if (bbox_top <= other.y) {
		// Player is completely abducted
		if (!takingDamage) {
			--playerHealth;
		}
		with (other.creator) {
			instance_destroy(other.ufoBeam);
			abducting = false;
			timer = 0;
			ufoBeam = noone;
		}
		instance_destroy(other);
	}
	customGravity = 0;
}