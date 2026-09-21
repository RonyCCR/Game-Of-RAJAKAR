extends Area2D
var meteor_speed: int 
var meteor_direction: float 
var meteor_rotation: int
signal collision


func _ready() -> void:
	var rng:= RandomNumberGenerator.new()
	var path: String = "res://Game of RAJAKAR/"+str(rng.randi_range(1,5))+".png"
	$Sprite2D.texture= load(path)
	var width= get_viewport().get_visible_rect().size[0]
	var random_x= rng.randi_range(0, width)
	var random_y= rng.randi_range(-150, -50)
	position= Vector2(random_x, random_y)
	
	meteor_speed = rng.randi_range(400, 550)
	meteor_direction= rng.randf_range(-1.0,1.0)
	meteor_rotation= rng.randi_range(15,45)
	
func _process(delta: float) -> void:
	position += Vector2(meteor_direction,1) * meteor_speed * delta
	rotation_degrees += meteor_rotation * delta
	

	
func _on_body_entered(_body: Node2D) -> void:
	collision.emit()
	queue_free()



func _on_area_entered(area: Area2D) -> void:
	get_tree().call_group('ui', 'increase_ellimination', 'others')
	area.queue_free()
	queue_free()
