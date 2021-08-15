#macro FRAME_RATE 60
#macro CARDINAL_DIRECTION round(direction / 180)

#macro ROOM_EDGE_WIDTH_BUFFER 20
#macro ROOM_EDGE_FLOOR_BUFFER 10
#macro ROOM_EDGE_CEILING_BUFFER 20

// New spawning constants (to implement)
#macro PLATFORM_HEIGHT 6
#macro MAX_PLATFORM_SCALE 18
#macro MAX_SCALE_FACTOR 2.75
#macro SPAWNING_VERTICAL_OFFSET 50
#macro SPAWNING_HORIZONTAL_OFFSET 20
#macro SPAWNING_FILLED_THRESHOLD .4
#macro SPAWNING_COLUMNS 6
#macro SPAWNING_ROWS 5
#macro SPAWNING_ROW_HEIGHT 54
#macro SPAWNING_COLUMN_LENGTH 100

enum team {
	player,
	enemy,
	none
}

enum platformType {
	singleUfo,
	noUfo
	// player?
}