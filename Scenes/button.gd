extends Button

var pause_icon = load("res://Game of RAJAKAR/pause-01.png")
var resume_icon = load("res://Game of RAJAKAR/resume-01.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../../PauseMessage".visible = false
	toggled.connect(_on_button_toggled)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Quit"):
		$".".button_pressed = !$".".button_pressed

func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$".".icon = resume_icon
		$"../../../PauseSound".play()
		get_tree().paused = true
		$"../../PauseMessage".visible = true
	else:
		$".".icon = pause_icon
		$"../../../PauseSound".play()
		get_tree().paused = false
		$"../../PauseMessage".visible = false
