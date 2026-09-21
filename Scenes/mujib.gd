extends Area2D

var mujib_speed: int 
var mujib_direction: float 
var mujib_rotation: int
signal collision


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng:= RandomNumberGenerator.new()
	var path: String = "res://Game of RAJAKAR/Mujib.png"
	$Sprite2D.texture= load(path)
	var width= get_viewport().get_visible_rect().size[0]
	var random_x= rng.randi_range(0, width)
	var random_y= rng.randi_range(-200, -50)
	position= Vector2(random_x, random_y)
	
	mujib_speed = rng.randi_range(450, 600)
	mujib_direction= rng.randf_range(-1.0,1.0)
	mujib_rotation= rng.randi_range(15,45)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(mujib_direction,1) * mujib_speed * delta
	rotation_degrees += mujib_rotation * delta
	

func _on_body_entered(body: Node2D) -> void:
	collision.emit()
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	get_tree().call_group('ui', 'increase_ellimination','mujib')
	area.queue_free()
	queue_free()
	
