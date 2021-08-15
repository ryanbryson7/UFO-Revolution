// Initializes the spawningSquares array with unfilled spawningSquare objects
function intialize_spawning_squares() {
	var _array;
	for (var i = 0; i < SPAWNING_COLUMNS; ++i) {
		for (var j = 0; j < SPAWNING_ROWS; ++j) {
			var _spawningSquare = instance_create_layer(0, 0, "SpawningSquares", obj_spawning_square);
			_spawningSquare.topY = (j * SPAWNING_ROW_HEIGHT) + SPAWNING_VERTICAL_OFFSET;
			_spawningSquare.bottomY = ((j + 1) * SPAWNING_ROW_HEIGHT) + SPAWNING_VERTICAL_OFFSET;
			_spawningSquare.leftX = (i * SPAWNING_COLUMN_LENGTH) + SPAWNING_HORIZONTAL_OFFSET;
			_spawningSquare.rightX = ((i + 1) * SPAWNING_COLUMN_LENGTH) + SPAWNING_HORIZONTAL_OFFSET;
			
			_spawningSquare.row = j;
			_spawningSquare.column = i;
			
			_array[i][j] = _spawningSquare;
		}
	}
	
	return _array;
}

// Handles all the logic for spawning platforms until the room is sufficiently filled
function initialize_room() {
	var _spawnSquaresFilled = 0;
	var _canSpawnSingleUfo = true;
	var _maxSpawningSquareLength = SPAWNING_COLUMNS;  // represents the longest platform square that can be spawned
	
	// Big while-loop boiiiiiiii
	while (!check_spawning_threshold(_spawnSquaresFilled)) {
		// TODO: Consider making this a counter (int) and then forcing a successful spawn if it gets too high 
		// This will ensure the game doesn't take excessively long to spawn the room and start (unlikely but possible)
		var _didSpawn = false;  
		
		// Select platform type
		var _randomPlatformType;
		if (_canSpawnSingleUfo) {
			_randomPlatformType	= choose(platformType.singleUfo, platformType.noUfo);
		}
		else {
			_randomPlatformType = platformType.noUfo;
		}
		
		// Try to spawn the platform
		switch _randomPlatformType {
			case platformType.singleUfo: {
				var _rowToCheck = irandom_range(2, SPAWNING_ROWS - 1);
				var _columnToCheck = irandom_range(0, SPAWNING_COLUMNS - 1);
				
				if (!spawningSquares[_columnToCheck][_rowToCheck].filled
					&& !spawningSquares[_columnToCheck][_rowToCheck - 1].filled
					&& !spawningSquares[_columnToCheck][_rowToCheck - 2].filled) {
				
					//Spawn platform and UFO and update spawningSquares, filledSquares and didSpawn
					var _platformX = (spawningSquares[_columnToCheck][_rowToCheck].leftX + spawningSquares[_columnToCheck][_rowToCheck].rightX) / 2;
					var _platformY = spawningSquares[_columnToCheck][_rowToCheck].bottomY - PLATFORM_HEIGHT;
					
					var _platform = instance_create_layer(_platformX, _platformY, "Instances", obj_platform);
					_platform.image_xscale = random_range(1, MAX_SCALE_FACTOR);
					spawn_alien_ufo(_platform);
					
					
					spawningSquares[_columnToCheck][_rowToCheck].filled = true;
					spawningSquares[_columnToCheck][_rowToCheck - 1].filled = true;
					spawningSquares[_columnToCheck][_rowToCheck - 2].filled = true;
					_spawnSquaresFilled += 3;
					_didSpawn = true;
				}
				else {
					_didSpawn = false;	
				}
				
				break;
			}
			case platformType.noUfo: {
				var _platformSquareLength = irandom_range(1, _maxSpawningSquareLength);
				var _rowToCheck = irandom_range(0, SPAWNING_ROWS - 1);
				var _columnToCheck = irandom_range(0, SPAWNING_COLUMNS - _platformSquareLength);
				
				var _canSpawn = true;
				for (var i = 0; i < _platformSquareLength; ++i) {
					if (_columnToCheck + i >= 6) {
						hello = true;
					}
					if (spawningSquares[_columnToCheck + i][_rowToCheck].filled) {
						_canSpawn = false;
						break;  // This should only break out of the for-loop? (I don't think it matters)
					}
				}
				
				if (_canSpawn) {
					// Find center of the spawningSquares
					var _platformX = (spawningSquares[_columnToCheck][_rowToCheck].leftX + spawningSquares[_columnToCheck + _platformSquareLength - 1][_rowToCheck].rightX) / 2;
					var _platformY = spawningSquares[_columnToCheck][_rowToCheck].bottomY;
				
					// Create platform 
					var _platform = instance_create_layer(_platformX, _platformY, "Instances", obj_platform);
					_platform.image_xscale = random_range(MAX_SCALE_FACTOR *(_platformSquareLength - 1), MAX_SCALE_FACTOR* _platformSquareLength);
					_platform.image_xscale = max(1, _platform.image_xscale); // prevents having platforms with xscale = 0
					_platform.image_xscale = min(_platform.image_xscale, MAX_PLATFORM_SCALE);
					
					// Create alien(s)
					// TODO: Spawn more aliens on a platform as player score increases
					spawn_alien_ground(_platform);
					
					//Update spawning variables
					for (var i = 0; i < _platformSquareLength; ++i) {
						spawningSquares[_columnToCheck + i][_rowToCheck].filled = true;
						++_spawnSquaresFilled;
					}
					_didSpawn = true;
				
				}
				else {
					_didSpawn = false;	
				}				
				
				break;
			}
		}
		
		
		if (_didSpawn) {
			_canSpawnSingleUfo = check_can_spawn_single_ufo();
			_maxSpawningSquareLength = check_max_spawning_square_length();
		}
	}
}

// Checks if the room is sufficiently populated with platforms (and aliens)
// @returns boolean
function check_spawning_threshold(_spawnSquaresFilled) {
	if (_spawnSquaresFilled / (SPAWNING_ROWS * SPAWNING_COLUMNS) >= SPAWNING_FILLED_THRESHOLD) {
		return true;	
	}
	else {
		return false;
	}
}

// Checks if the room has space for a single ufo platform
// returns boolean
function check_can_spawn_single_ufo() {
	for (var i = 0; i < SPAWNING_COLUMNS; ++i) {
		for (var j = 2; j < SPAWNING_ROWS; ++j) {
			if (!spawningSquares[i][j].filled && !spawningSquares[i][j - 1].filled && !spawningSquares[i][j - 2].filled) {
				return true;	
			}
		}
	}
	
	return false;
}

// Checks what the largest platform length the room can fit
// returns int
function check_max_spawning_square_length() {
	var _max = 0;
	
	for (var j = 0; j < SPAWNING_ROWS; ++j) {
		var _localMax = 0;
		for (var i = 0; i < SPAWNING_COLUMNS; ++i) {
			if (!spawningSquares[i][j].filled) {
				++_localMax;
			}
			else {
				_localMax = 0;	
			}
			
			if (_localMax > _max) {
				_max = _localMax;	
			}
		}
	}
	
	return _max;
}