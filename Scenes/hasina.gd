extends Area2D

var hasina_speed: int 
var hasina_direction: float 
var hasina_rotation: int
signal collision


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng:= RandomNumberGenerator.new()
	var path: String = "res://Game of RAJAKAR/Hasina.png"
	$Sprite2D.texture= load(path)
	var width= get_viewport().get_visible_rect().size[0]
	var random_x= rng.randi_range(0, width)
	var random_y= rng.randi_range(-200, -50)
	position= Vector2(random_x, random_y)
	
	hasina_speed = rng.randi_range(550, 700)
	hasina_direction= rng.randf_range(-1.0,1.0)
	hasina_rotation= rng.randi_range(15,45)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(hasina_direction,1) * hasina_speed * delta
	rotation_degrees += hasina_rotation * delta
	

func _on_body_entered(body: Node2D) -> void:
	collision.emit()
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	get_tree().call_group('ui', 'increase_ellimination', 'hasina')
	area.queue_free()
	queue_free()
