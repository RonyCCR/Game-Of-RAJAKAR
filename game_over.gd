extends Control
@export var level: PackedScene
var can_input: bool = false

func _ready() -> void:
	$CenterContainer/VBoxContainer/HBoxContainer/Label3.text = "Salute Hero! " + "You Killed " + str(Global.elliminations) + " Awami League."
	$GameOverMusic.play()
	await get_tree().create_timer(3).timeout
	$GameOverMusic2.play()
	await get_tree().create_timer(1.5).timeout
	$MarginContainer/Label.text = "Press SPACE to start again OR ESC TO RETURN"
	can_input = true
	
func _process(_delta):
	if !can_input:
		return
	else:
		if Input.is_action_just_pressed("Shoot"):
			get_tree().change_scene_to_packed(level)
	
		if Input. is_action_just_pressed("Quit"):
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
