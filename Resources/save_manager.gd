extends Node

#locate the file directory for where the save files should be stored
const FileDir: String = "user://saves/"
#name each save file independant from each other
const Save1: String = "save1"
const Save2: String = "save2"
const Save3: String = "save3"
const DefaultData: Dictionary = {
	"CurrentRoom": "Maze",
	"PlayerCoords": {
		"x": 744.0,
		"y": 128.0
	},
	"PlayerCoords_MazeReturn": {
		"x": 744.0,
		"y": 128.0
	},
	"DoorsOpened": {
		"DoorExit":   false,
		"DoorOne":    false,
		"DoorTwo":    false,
		"DoorThree":  false,
		"DoorFour":   false,
		"DoorFive":   false,
		"DoorSix":    false,
		"DoorSeven":  false,
		"DoorEight":  false,
		"DoorNine":   false,
		"DoorTen":    false,
		"DoorEleven": false,
		"DoorTwelve": false
	}
}

func save_data(which_save: String, data: Dictionary) -> void:
	var save_file: FileAccess = FileAccess.open(FileDir+which_save,FileAccess.WRITE)
	var string_data: String = JSON.stringify(data)
	save_file.store_line(string_data)
	save_file.close()

func load_data(which_save: String) -> Dictionary:
	if FileAccess.file_exists(FileDir+which_save):
		var save_file: FileAccess = FileAccess.open(FileDir+which_save,FileAccess.READ)
		if save_file == null:
			push_error("Error reading file.")
			return DefaultData
		
		var json = JSON.new()
		
		var string_data: String = save_file.get_line()
		if json.parse(FileDir+which_save) == OK:
			var data: Dictionary = json.get_data()
			save_file.close()
			return data
		push_error("Data Corrupted -_-")
	get_tree().change_scene_to_file("res://Scenes/Levels/Maze.tscn")
	return DefaultData
