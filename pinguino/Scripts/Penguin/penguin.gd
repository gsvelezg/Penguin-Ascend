extends CharacterBody3D
class_name Penguin

# Variables
@export var walking_speed : float 
@export var jump_power : float 
@export var gravity : float = 9.8

var direction : Vector3 = Vector3.ZERO
var states_names:PenguinStateNames = PenguinStateNames.new() #Creamos un objeto de tipo PenStatesNames

func _ready():
	pass
	
func _physics_process(delta):
	if velocity.length() >= 0.01:
		$PinguWalk/AnimationPlayer.play("Walk")
	direction = get_movement_input()
	velocity.z = direction.z * walking_speed
	velocity.x = direction.x * walking_speed
	if wants_to_jump():
		jump()
	handle_gravity(delta)
	move_and_slide()

func handle_gravity(delta) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
		
func get_movement_input() -> Vector3:
	var input_x = Input.get_axis("ui_left", "ui_right")
	var input_z = Input.get_axis("ui_up", "ui_down")
	return Vector3(input_x, 0, input_z).normalized()
	
func wants_to_jump() -> bool:
	return Input.is_action_just_pressed("jump")
	
	
####### Métodos que llaman los estados
func jump() -> void:
	if is_on_floor():
		velocity.y = jump_power 
