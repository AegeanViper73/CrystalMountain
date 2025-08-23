extends Node2D

@onready var pause_anim:      AnimationPlayer = $Pause
@onready var save_stuff_anim: AnimationPlayer = $SaveStuff

@export var player_in_scene: CharacterBody2D
@export var door_keys: Node

const SAVE_DIR:          String = "user://saves/"
const SAVE_FILE_ONE:     String = "save1.json"
const SAVE_FILE_TWO:     String = "save2.json"
const SAVE_FILE_THREE:   String = "save3.json"
const DEFAULT_SAVE_FILE: String = "default.json"

var player_data = PlayerData.new()
var maze_data   = MazeData.new()

var game_paused:      bool   = false
var save_stuff_state: String = "BothClosed"

func _ready() -> void:
	verify_save_directory(SAVE_DIR)
	#load_data(SAVE_DIR + DEFAULT_SAVE_FILE)

func verify_save_directory(path: String):
	DirAccess.make_dir_absolute(path)

func save_data(path: String):
	var file = FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		print(FileAccess.get_open_error())
		return
	
	var data = {
		"player_data": {
			"PlayerPosition": {
				"x": player_in_scene.position.x,
				"y": player_in_scene.position.y
			}
		},
		"door_data": {
			"DoorOne":    door_keys.Keys["One"],   
			"DoorTwo":    door_keys.Keys["Two"],   
			"DoorThree":  door_keys.Keys["Three"],   
			"DoorFour":   door_keys.Keys["Four"],   
			"DoorFive":   door_keys.Keys["Five"],  
			"DoorSix":    door_keys.Keys["Six"],   
			"DoorSeven":  door_keys.Keys["Seven"], 
			"DoorEight":  door_keys.Keys["Eight"], 
			"DoorNine":   door_keys.Keys["Nine"],  
			"DoorTen":    door_keys.Keys["Ten"],   
			"DoorEleven": door_keys.Keys["Eleven"],
			"DoorTwelve": door_keys.Keys["Twelve"],
			"DoorExit":   door_keys.Keys["Exit"]   
		}
	}
	
	var json_string = JSON.stringify(data, "\t")
	file.store_string(json_string)
	file.close()
	

func load_data(path: String):
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		if file == null:
			print(FileAccess.get_open_error())
			return
		
		var content = file.get_as_text()
		file.close()
		
		var data = JSON.parse_string(content)
		if data == null:
			printerr("Cannot open non-existent file at %s!" % [path, content])
			return
		
		#player_data = PlayerData.new()
		player_in_scene.position = Vector2(data.player_data.PlayerPosition.x, data.player_data.PlayerPosition.y)
		
		#maze_data = MazeData.new()
		door_keys.Keys["One"]    = data.door_data.DoorOne
		door_keys.Keys["Two"]    = data.door_data.DoorTwo
		door_keys.Keys["Three"]  = data.door_data.DoorThree
		door_keys.Keys["Four"]   = data.door_data.DoorFour
		door_keys.Keys["Five"]   = data.door_data.DoorFive
		door_keys.Keys["Six"]    = data.door_data.DoorSix
		door_keys.Keys["Seven"]  = data.door_data.DoorSeven
		door_keys.Keys["Eight"]  = data.door_data.DoorEight
		door_keys.Keys["Nine"]   = data.door_data.DoorNine
		door_keys.Keys["Ten"]    = data.door_data.DoorTen
		door_keys.Keys["Eleven"] = data.door_data.DoorEleven
		door_keys.Keys["Twelve"] = data.door_data.DoorTwelve
		door_keys.Keys["Exit"]   = data.door_data.DoorExit
		
		#update_load(player_data, maze_data)
	
	else:
		printerr("Cannot open non-existent file at %s!" % [path])
	print("Loading Complete")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		game_paused = !game_paused
	
	if game_paused == true:
		pause_anim.play("PauseGame")
	elif game_paused == false:
		pause_anim.play("UnpauseGame")
		save_stuff_anim.play("CloseBoth")
	
	if save_stuff_state == "BothClosed":
		save_stuff_anim.play("CloseBoth")
	elif save_stuff_state == "SaveOpened":
		save_stuff_anim.play("OpenSave")
	elif save_stuff_state == "LoadOpened":
		save_stuff_anim.play("OpenLoad")



func _on_resume_pressed() -> void:
	game_paused = false

func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_save_pressed() -> void:
	if save_stuff_state == "SaveOpened":
		save_stuff_state = "BothClosed"
	else:
		save_stuff_state = "SaveOpened"

func _on_load_pressed() -> void:
	if save_stuff_state == "LoadOpened":
		save_stuff_state = "BothClosed"
	else:
		save_stuff_state = "LoadOpened"


func _on_save_file_1_pressed() -> void:
	save_data(SAVE_DIR + SAVE_FILE_ONE)

func _on_save_file_2_pressed() -> void:
	save_data(SAVE_DIR + SAVE_FILE_TWO)

func _on_save_file_3_pressed() -> void:
	save_data(SAVE_DIR + SAVE_FILE_THREE)

func _on_load_file_1_pressed() -> void:
	load_data(SAVE_DIR + SAVE_FILE_ONE)
	game_paused = false
	save_stuff_state = "BothClosed"

func _on_load_file_2_pressed() -> void:
	load_data(SAVE_DIR + SAVE_FILE_TWO)
	game_paused = false
	save_stuff_state = "BothClosed"

func _on_load_file_3_pressed() -> void:
	load_data(SAVE_DIR + SAVE_FILE_THREE)
	game_paused = false
	save_stuff_state = "BothClosed"

func _on_load_file_default_pressed() -> void:
	load_data(SAVE_DIR + DEFAULT_SAVE_FILE)
	game_paused = false
	save_stuff_state = "BothClosed"
