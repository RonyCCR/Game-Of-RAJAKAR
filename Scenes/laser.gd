extends Area2D
@export var LaserSpeed = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= LaserSpeed*delta
