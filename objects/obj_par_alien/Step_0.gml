// Parent

if (enemyHealth <= 0) {
	instance_destroy();
}
else {
	if (y < startingY) {
		y += fallSpeed;
		y = min(startingY, y);
	}
	else if (y > startingY) {
		//Shouldn't happen if I code this right
		y = startingY;
	}
}