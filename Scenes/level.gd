extends Node2D

#1. Load Scene
var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser.tscn")
var hasina_scene: PackedScene = load("res://Scenes/hasina.tscn")
var modi_scene: PackedScene = load("res://Scenes/modi.tscn")
var mujib_scene: PackedScene = load("res://Scenes/mujib.tscn")
var life_scene: PackedScene = load("res://Scenes/life.tscn")

var health = 6
var BossIntervalTime = 15
var BossDensity = 0.25

func _ready():
	get_tree().call_group('ui', 'set_health', health)
	$GameBGM.play()
	
	# Shobgulo alada loop call na kore ekta single master wave manager shuru korlam
	start_master_wave_coordinator()
	start_life_wave_loop() # Life-er ta independent rakhte paro

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	meteor.connect('collision', _on_meteor_collision)

func _on_meteor_collision():
	health -=1
	$Player.play_damage_sound()
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")

func _on_life_collision():
	$LifeSound.play()
	if health >= 5:
		return
	else:
		health +=1
		get_tree().call_group('ui', 'set_health', health)

func _on_player_laser(pos, pos1, pos2) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	var laser1 = laser_scene.instantiate()
	$Lasers.add_child(laser1)
	laser1.position = pos1
	var laser2 = laser_scene.instantiate()
	$Lasers.add_child(laser2)
	laser2.position = pos2


# --- Single Master Coordinator (Ekta wave shesh hole onnota ashbe) ---
func start_master_wave_coordinator() -> void:
	while true:
		# 1. Prothome Modi-er wave (13 second por por ba icche moto biroti)
		await get_tree().create_timer(BossIntervalTime).timeout
		await spawn_modi_wave()
		
		# 2. Modi shesh howar por ektu biroti diye Mujib-er wave
		await get_tree().create_timer(BossIntervalTime).timeout
		await spawn_mujib_wave()
		
		# 3. Mujib shesh howar por Hasina-er wave
		await get_tree().create_timer(BossIntervalTime).timeout
		await spawn_hasina_wave()


# --- Individual Wave Spawning Functions ---

func spawn_modi_wave() -> void:
	var spawn_duration = 10.0
	var elapse_time = 0.0
	while elapse_time < spawn_duration:
		var modi = modi_scene.instantiate()
		$Modis.add_child(modi)
		modi.connect('collision', _on_meteor_collision)
		await get_tree().create_timer(BossDensity).timeout
		elapse_time += 0.275

func spawn_mujib_wave() -> void:
	var spawn_duration = 10.0
	var elapse_time = 0.0
	while elapse_time < spawn_duration:
		var mujib = mujib_scene.instantiate()
		$Mujibs.add_child(mujib)
		mujib.connect('collision', _on_meteor_collision)
		await get_tree().create_timer(BossDensity).timeout
		elapse_time += 0.275

func spawn_hasina_wave() -> void:
	var spawn_duration = 10.0
	var elapse_time = 0.0
	while elapse_time < spawn_duration:
		var hasina = hasina_scene.instantiate()
		$Hasinas.add_child(hasina)
		hasina.connect('collision', _on_meteor_collision)
		await get_tree().create_timer(BossDensity).timeout
		elapse_time += 0.2

# Life-er ta independent thakbe jate player dorkar moto life pete pare
func start_life_wave_loop():
	while true:
		await get_tree().create_timer(15.0).timeout
		var spawn_duration = 5.0
		var elapse_time = 0.0
		while elapse_time < spawn_duration:
			var life = life_scene.instantiate()
			$Lifes.add_child(life)
			life.connect('collision', _on_life_collision)
			await get_tree().create_timer(BossDensity).timeout
			elapse_time += 0.3
