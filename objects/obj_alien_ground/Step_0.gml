// Alien Ground
event_inherited();

if (enemyHealth > 0 && y == startingY) {
	if (!check_point_between_ends(x, left_edge, right_edge)) {
		if (CARDINAL_DIRECTION == 0) {
			// TODO: Adjust animation
			direction += 180;
		}
		else {
			direction -= 180;
		}
		horizontalSpeed *= -1;
	}
	x += horizontalSpeed;
}