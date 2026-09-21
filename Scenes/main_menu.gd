extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_quit_button_pressed() -> void:
	$ClickSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_start_button_pressed() -> void:
	$ClickSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	
func _on_option_button_pressed() -> void:
	$ClickSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/options.tscn")

func _on_about_button_pressed() -> void:
	$ClickSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/about.tscn")




func _on_start_button_mouse_entered() -> void:
	$HoverSound.play()
func _on_quit_button_mouse_entered() -> void:
	$HoverSound.play()
func _on_about_button_mouse_entered() -> void:
	$HoverSound.play()
func _on_option_button_mouse_entered() -> void:
	$HoverSound.play()
	
