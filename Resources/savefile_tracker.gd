extends Node
class_name FileTracker

@export var IsGamePaused: bool = false
@export var CurrentRoom: String
@export var PlayerCoords: Vector2
@export var PlayerCoords_MazeReturn: Vector2
@export var DoorsOpened: Dictionary = {
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
@export var StairsPlaced: bool = false
@export var StairCoords: Dictionary = {
	"StairExit1Loc":  1,
	"StairExit3Loc":  1,
	"StairExit4Loc":  1,
	"StairExit5Loc":  1,
	"StairExit6Loc":  1,
	"StairExit7Loc":  1,
	"StairExit8Loc":  1,
	"StairExit9Loc":  1,
	"StairOneLoc":    1,
	"StairTwoLoc":    1,
	"StairThreeLoc":  1,
	"StairFourLoc":   1,
	"StairFiveLoc":   1,
	"StairSixLoc":    1,
	"StairSevenLoc":  1,
	"StairEightLoc":  1,
	"StairNineLoc":   1,
	"StairTenLoc":    1,
	"StairElevenLoc": 1,
	"StairTwelveLoc": 1
}


func _process(delta: float) -> void:
	if get_tree().current_scene != null:
		CurrentRoom = get_tree().current_scene.name
		if get_tree().current_scene.has_node("PlayerFreeMove"):
			PlayerCoords = round(get_tree().current_scene.get_node("PlayerFreeMove").transform.origin)
		elif get_tree().current_scene.has_node("PlayerPlatformer"):
			PlayerCoords = round(get_tree().current_scene.get_node("PlayerPlatformer").transform.origin)
		#print(PlayerCoords_MazeReturn)
		#if CurrentRoom == "Maze":
			#PlayerCoords = round(get_tree().current_scene.get_node("PlayerFreeMove").transform.origin)
		#else: PlayerCoords = round(get_tree().current_scene.get_node("PlayerPlatformer").transform.origin)
		#prints(CurrentRoom)
		#print(PlayerCoords)

func load_file(data: Dictionary):
	
	pass
