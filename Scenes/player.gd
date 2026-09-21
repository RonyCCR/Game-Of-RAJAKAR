extends CharacterBody2D
@export var speed: int = 750
signal laser(pos, pos1, pos2)
var can_shoot: bool= true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var Direction = Input.get_vector("Left move", "Right Move", "Up move", "Down move")
	velocity = Direction * speed
	
	if (Input. is_action_pressed("Down move") and Input.is_action_pressed("Sprint")) or (Input. is_action_pressed("Up move") and Input.is_action_pressed("Sprint")) or (Input. is_action_pressed("Left move") and Input.is_action_pressed("Sprint")) or (Input. is_action_pressed("Right Move") and Input.is_action_pressed("Sprint")):
		Direction = Input.get_vector("Left move", "Right Move", "Up move", "Down move")
		velocity = Direction * (speed + 450)
	move_and_slide()

	if Input.is_action_just_pressed("Shoot") and can_shoot:
		laser.emit($LaserPosition.global_position, $LaserPosition2.global_position, $LaserPosition3.global_position)
		can_shoot= false
		$LaserTimer.start()
		$LaserSound.play()



func play_damage_sound():
	$DamageSound.play()


func _on_laser_timer_timeout() -> void:
	can_shoot= true
