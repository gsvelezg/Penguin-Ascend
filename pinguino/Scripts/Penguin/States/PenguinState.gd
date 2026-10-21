extends State
class_name PenguinState

var penguin: Penguin:
	get:
		return controlled_node as Penguin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
