class_name PenguinStateNames 

enum state_names{
	IDLE,
	WALKING,
	RUNNING,
	SLIDING,
	FALLING
}

static func get_states() -> Dictionary:
	return{
		state_names.IDLE:PenguinIdleState
	}
static func get_initial_state():
	return state_names.IDLE
