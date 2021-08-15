function check_max_speed() {
	verticalSpeed = clamp(verticalSpeed, -maxSpeed, maxSpeed);
}

function check_point_between_ends(_point, _leftEnd, _rightEnd) {
	
	// Consider changing the '<, >' to '<=, >='
	return (_point <= _rightEnd) && (_point >= _leftEnd);
}