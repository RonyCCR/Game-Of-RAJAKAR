extends TextureRect

@export var wiggle_speed: float = 1.0      
@export var wiggle_amount_rot: float = 0.03 
@export var wiggle_amount_pos: float = 5.0  

var time_passed: float = 0.0
@onready var initial_position: Vector2 = position 
@onready var initial_rotation: float = rotation  

func _process(delta: float) -> void:
	time_passed += delta * wiggle_speed
	
	
	rotation = initial_rotation + sin(time_passed) * wiggle_amount_rot
	
	position.x = initial_position.x + cos(time_passed * 0.7) * wiggle_amount_pos
	position.y = initial_position.y + sin(time_passed) * (wiggle_amount_pos * 0.5)
