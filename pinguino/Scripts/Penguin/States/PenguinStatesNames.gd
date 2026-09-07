class_name PenguinStatesNames 

const IDLE := "idle"
const WALKING := "walking"
const SPRINTING := "sprinting"
const SLIDING := "sliding"
const FALLING := "falling"

static func get_states() -> Dictionary:
	return {
		IDLE: IdleState,
		WALKING: WalkingState,
	}
static func get_initial_state() -> IdleState:
	return IdleState
