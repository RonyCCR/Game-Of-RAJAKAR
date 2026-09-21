extends Area2D

var life_speed: int 
var life_direction: float 
var life_rotation: int
signal collision


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng:= RandomNumberGenerator.new()
	var path: String = "res://Game of RAJAKAR/Life-01.png"
	$Sprite2D.texture= load(path)
	var width= get_viewport().get_visible_rect().size[0]
	var random_x= rng.randi_range(0, width)
	var random_y= rng.randi_range(-200, -50)
	position= Vector2(random_x, random_y)
	
	life_speed = rng.randi_range(300, 450)
	life_direction= rng.randf_range(-1.0,1.0)
	life_rotation= rng.randi_range(15,45)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(life_direction,1) * life_speed * delta
	rotation_degrees += life_rotation * delta
	

func _on_body_entered(body: Node2D) -> void:
	collision.emit()
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
