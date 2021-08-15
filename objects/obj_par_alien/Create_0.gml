sprite_index = spr_alien;

enemyHealth = 1;
pushback = .25; // Distance (or speed maybe?) that either the enemy or player moves when hit

horizontalSpeed = 2;
fallSpeed = 2;
abductedSpeed = 3.5;
left_edge = 0;
right_edge = room_width;
startingY = y;

scoreGiven = 10;

if (instance_exists(obj_game)) {
	++obj_game.numberOfAliens;	
}