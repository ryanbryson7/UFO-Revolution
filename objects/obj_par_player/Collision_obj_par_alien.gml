// If we're above the enemy, do damage
// Else, take damage :(

var _pushback;
var _enemyX;
var _enemyY;
var _spriteHeight;
var _scoreEarned = 0;


with (other) {
	_pushback = pushback;
	_enemyX = x;
	_enemyY = y;
	_spriteHeight = sprite_height;
}

if ((y < _enemyY - (_spriteHeight / 2) && verticalSpeed >= 0 && state != player_state_ufo) || state == player_state_abducting) {
	with (other) {
		if (enemyHealth - 1 <= 0) {
			_scoreEarned = scoreGiven;
		}
		--enemyHealth;		
	}
	verticalSpeed = (y - _enemyY) * _pushback;
	horizontalSpeed = (x - _enemyX) * _pushback;
}
else if (takingDamage) {
	// Nothing changes here
}
else {
	horizontalSpeed = (x - _enemyX) * _pushback;
	// Take Damage and get knocked back (or enter a damaged state for a second)
	damageTimeCounter = 0;
	--playerHealth;
	takingDamage = true;
}

// I know this is inaccurate naming but I don't care :D

playerScore += _scoreEarned;