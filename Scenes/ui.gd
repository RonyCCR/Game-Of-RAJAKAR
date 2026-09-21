extends CanvasLayer
static var image = load("res://Base/Small/Ship_2_A_Small.png")
var time_survived := 0
var Ellimination := 0

func set_health (amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	for i in amount:
		var text_rect= TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)


func _on_timer_timeout():
	time_survived +=1
	Global.survived = time_survived
	#$MarginContainer/HBoxContainer/Label.text = "Time Survived: " + str(time_survived)
	
func increase_ellimination(boss_type):
	if boss_type == 'mujib':
		$"../MujibSound".play()
	elif boss_type == 'hasina':
		$"../HasinaSound".play()
	elif boss_type == 'modi':
		$"../JanaGanaManaMusic".play()
	elif boss_type == 'others':
		$"../ExlposionSound".play()
	Ellimination += 1
	Global.elliminations = Ellimination
	$MarginContainer/HBoxContainer/Label2.text = "KILLED: " + str(Global.elliminations)
