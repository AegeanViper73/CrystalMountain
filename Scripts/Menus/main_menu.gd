extends Control

const Save1: String = "user://saves/save1"
const Save2: String = "user://saves/save2"
const Save3: String = "user://saves/save3"

@onready var save_1: Button = $Play/VBoxContainer/hCont1/Save1
@onready var save_2: Button = $Play/VBoxContainer/hCont1/Save2
@onready var save_3: Button = $Play/VBoxContainer/hCont1/Save3

@onready var main: BoxContainer = $Main
@onready var play: BoxContainer = $Play

var Menu: String = "Main"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if FileAccess.file_exists(Save1):
		save_1.disabled = false
	else: save_1.disabled = true
	if FileAccess.file_exists(Save2):
		save_2.disabled = false
	else: save_2.disabled = true
	if FileAccess.file_exists(Save3):
		save_3.disabled = false
	else: save_3.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Menu == "Main":
		main.visible = true
		play.visible = false
	elif Menu == "Play":
		main.visible = false
		play.visible = true

#region Main Buttons
func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_start_pressed() -> void:
	Menu = "Play"
#endregion

#region Play Buttons
func _on_save_1_pressed() -> void:
	SaveManager.load_data(SaveManager.Save1)

func _on_new_game_pressed() -> void:
	SaveManager.load_data("Default")

func _on_back_pressed() -> void:
	Menu = "Main"
#endregion
