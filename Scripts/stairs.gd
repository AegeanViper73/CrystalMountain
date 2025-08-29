extends Node2D

@onready var stair_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export_enum("Left","Right","Up","Down") var StairDirection: String
@export_enum("Exit","One","Two","Three","Four","Five",
			 "Six","Seven","Eight","Nine","Ten","Eleven",
			 "Twelve") var StairNumber: String
@export var RoomSpotChoice: int
@export var GoToLevel: String
@export var ReturnLoc: Vector2
@export var StairLocs: Dictionary = {
	"StairExit1Loc": {
		"Loc1": {
			"x": 296.0,
			"y": 152.0,
			"StairDir": "Left"
		},
		"Loc2": {
			"x": 88.0,
			"y": 472.0,
			"StairDir": "Right"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevelExit1.tscn"
	},
	"StairExit3Loc": {
		"Loc1": {
			"x": 1208.0,
			"y": 152.0,
			"StairDir": "Left"
		},
		"Loc2": {
			"x": 1144.0,
			"y": 280.0,
			"StairDir": "Right"
		},
		"Loc3": {
			"x": 1304.0,
			"y": 472.0,
			"StairDir": "Left"
		},
		"PickLoc": randi_range(1,3),
		"Level": "res://Scenes/Levels/MazeLevelExit3.tscn"
	},
	"StairExit4Loc": {
		"Loc1": {
			"x": 280.0,
			"y": 536.0,
			"StairDir": "Left"
		},
		"Loc2": {
			"x": 344.0,
			"y": 776.0,
			"StairDir": "Right"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevelExit4.tscn"
	},
	"StairExit5Loc": {
		"Loc1": {
			"x": 664.0,
			"y": 968.0,
			"StairDir": "Left"
		},
		"PickLoc": 1,
		"Level": "res://Scenes/Levels/MazeLevelExit5.tscn"
	},
	"StairExit6Loc": {
		"Loc1": {
			"x": 1224.0,
			"y": 728.0,
			"StairDir": "Up"
		},
		"Loc2": {
			"x": 1032.0,
			"y": 856.0,
			"StairDir": "Up"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevelExit6.tscn"
	},
	"StairExit7Loc": {
		"Loc1": {
			"x": 280.0,
			"y": 1096.0,
			"StairDir": "Up"
		},
		"Loc2": {
			"x": 40.0,
			"y": 1336.0,
			"StairDir": "Down"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevelExit7.tscn"
	},
	"StairExit8Loc": {
		"Loc1": {
			"x": 856.0,
			"y": 1288.0,
			"StairDir": "Right"
		},
		"Loc2": {
			"x": 792.0,
			"y": 1464.0,
			"StairDir": "Down"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevelExit8.tscn"
	},
	"StairExit9Loc": {
		"Loc1": {
			"x": 1032.0,
			"y": 1160.0,
			"StairDir": "Down"
		},
		"Loc2": {
			"x": 1336.0,
			"y": 1208.0,
			"StairDir": "Right"
		},
		"Loc3": {
			"x": 1224.0,
			"y": 1336.0,
			"StairDir": "Up"
		},
		"PickLoc": randi_range(1,3),
		"Level": "res://Scenes/Levels/MazeLevelExit9.tscn"
	},
	"StairOneLoc": {
		"Loc1": {
			"x": 1032.0,
			"y": 728.0,
			"StairDir": "Up"
		},
		"Loc2": {
			"x": 1288.0,
			"y": 904.0,
			"StairDir": "Down"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel1.tscn"
	},
	"StairTwoLoc": {
		"Loc1": {
			"x": 968.0,
			"y": 280.0,
			"StairDir": "Down"
		},
		"PickLoc": 1,
		"Level": "res://Scenes/Levels/MazeLevel2.tscn"
	},
	"StairThreeLoc": {
		"Loc1": {
			"x": 600.0,
			"y": 216.0,
			"StairDir": "Right"
		},
		"PickLoc": 1,
		"Level": "res://Scenes/Levels/MazeLevel3.tscn"
	},
	"StairFourLoc": {
		"Loc1": {
			"x": 408.0,
			"y": 600.0,
			"StairDir": "Right"
		},
		"Loc2": {
			"x": 728.0,
			"y": 1160.0,
			"StairDir": "Right"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel4.tscn"
	},
	"StairFiveLoc": {
		"Loc1": {
			"x": 648.0,
			"y": 600.0,
			"StairDir": "Right"
		},
		"Loc2": {
			"x": 968.0,
			"y": 968.0,
			"StairDir": "Down"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel5.tscn"
	},
	"StairSixLoc": {
		"Loc1": {
			"x": 600.0,
			"y": 776.0,
			"StairDir": "Down"
		},
		"Loc2": {
			"x": 840.0,
			"y": 792.0,
			"StairDir": "Right"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel6.tscn"
	},
	"StairSevenLoc": {
		"Loc1": {
			"x": 1336.0,
			"y": 280.0,
			"StairDir": "Right"
		},
		"Loc2": {
			"x": 1288.0,
			"y": 1400.0,
			"StairDir": "Down"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel7.tscn"
	},
	"StairEightLoc": {
		"Loc1": {
			"x": 840.0,
			"y": 536.0,
			"StairDir": "Right"
		},
		"Loc2": {
			"x": 536.0,
			"y": 600.0,
			"StairDir": "Down"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel8.tscn"
	},
	"StairNineLoc": {
		"Loc1": {
			"x": 472.0,
			"y": 232.0,
			"StairDir": "Down"
		},
		"Loc2": {
			"x": 104.0,
			"y": 296.0,
			"StairDir": "Up"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel9.tscn"
	},
	"StairTenLoc": {
		"Loc1": {
			"x": 1464.0,
			"y": 216.0,
			"StairDir": "Down"
		},
		"Loc2": {
			"x": 152.0,
			"y": 1096.0,
			"StairDir": "Right"
		},
		"Loc3": {
			"x": 1464.0,
			"y": 1160.0,
			"StairDir": "Down"
		},
		"PickLoc": randi_range(1,3),
		"Level": "res://Scenes/Levels/MazeLevel10.tscn"
	},
	"StairElevenLoc": {
		"Loc1": {
			"x": 40.0,
			"y": 856.0,
			"StairDir": "Up"
		},
		"Loc2": {
			"x": 600.0,
			"y": 1400.0,
			"StairDir": "Left"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel11.tscn"
	},
	"StairTwelveLoc": {
		"Loc1": {
			"x": 104.0,
			"y": 1160.0,
			"StairDir": "Left"
		},
		"Loc2": {
			"x": 344.0,
			"y": 1352.0,
			"StairDir": "Right"
		},
		"PickLoc": randi_range(1,2),
		"Level": "res://Scenes/Levels/MazeLevel12.tscn"
	}
}
var ReturnOffset: Vector2
func _ready() -> void:
	if StairDirection == "Left":
		stair_sprite.rotation_degrees = 90
		ReturnOffset = Vector2(30,0)
	elif StairDirection == "Right":
		stair_sprite.rotation_degrees = 270
		ReturnOffset = Vector2(-30,0)
	elif StairDirection == "Up":
		stair_sprite.rotation_degrees = 180
		ReturnOffset = Vector2(0,30)
	elif StairDirection == "Down":
		stair_sprite.rotation_degrees = 0
		ReturnOffset = Vector2(0,-30)



func _on_area_2d_body_entered(_body: Node2D) -> void:
	SaveFileTracker.PlayerCoords_MazeReturn = self.position + ReturnOffset
	get_tree().change_scene_to_file(GoToLevel)
