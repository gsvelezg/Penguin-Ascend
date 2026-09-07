class_name StateMachine
extends Node

var initial_state:State
var controlled_node: Node
var states: Dictionary = {}
var current_state: State


func _ready() -> void:
	controlled_node = get_parent() #La máquina se debe asociar como hija del nodo que quiere controlar
	_create_states(controlled_node.states_names.get_states())
	initial_state = controlled_node.states_names.get_initial_state()
	change_state(initial_state) #Tenemos que cambiarlo para que reciba un estado inicial genérico asociado @export


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)


func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func _create_states(state_definitions: Dictionary) -> void:
	
	for state_id in state_definitions:
		states[state_id] = state_definitions[state_id].new()
	
	for state in states.values():
		state.controlled_node = controlled_node
		state.state_machine = self


func change_state(state_name: String) -> void:
	if not states.has(state_name):
		push_error("StateMachine: el estado '%s' no existe." % state_name)
		return

	var new_state: State = states[state_name]

	if new_state == current_state:
		return

	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
