extends Control

@onready var main: BoxContainer = $Main
@onready var save: BoxContainer = $Save
var WhichMenu: String = "Main"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = SaveFileTracker.PlayerCoords.x - (size.x/2)
	position.y = SaveFileTracker.PlayerCoords.y - (size.y/2)
	if SaveFileTracker.IsGamePaused == false:
		visible = false
	else:
		visible = true
	
	if WhichMenu == "Main":
		main.visible = true
		save.visible = false
	else:
		main.visible = false
		save.visible = true

#region Main Buttons
func _on_resume_pressed() -> void:
	SaveFileTracker.IsGamePaused = false

func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_save_pressed() -> void:
	WhichMenu = "Save"

func _on_mainmenu_pressed() -> void:
	SaveFileTracker.IsGamePaused = false
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")

func _on_quitgame_pressed() -> void:
	get_tree().quit()
#endregion
#region Save Buttons
func _on_save_1_pressed() -> void:
	pass # Replace with function body.

func _on_save_2_pressed() -> void:
	pass # Replace with function body.

func _on_save_3_pressed() -> void:
	pass # Replace with function body.

func _on_back_pressed() -> void:
	WhichMenu = "Main"
#endregion
