extends Node2D
@export_enum("Vertical","Horizontal","Exit") var DoorDirection: String
#@export_enum("Exit","One","Two","Three","Four","Five",
			 #"Six","Seven","Eight","Nine","Ten",
			 #"Eleven","Twelve") var CurrentDoor: String
#@export var GetKeys: Node
@export var Opened: bool = false
@export_enum("Exit","One","Two","Three","Four","Five",
			 "Six","Seven","Eight","Nine","Ten","Eleven",
			 "Twelve") var DoorNumber: String

@onready var door_direction: AnimatedSprite2D = $AnimatedSprite2D
@onready var vertical: CollisionShape2D = $StaticBody2D/Vertical
@onready var horizontal: CollisionShape2D = $StaticBody2D/Horizontal

@export var DoorLocs: Dictionary = {
	"DoorExitLoc": {
		"x": 0,
		"y": 0
	},
	"DoorOneLoc": {
		"x": 216.0,
		"y": 504.0
	},
	"DoorTwoLoc": {
		"x": 600.0,
		"y": 504.0
	},
	"DoorThreeLoc": { 
		"x": 904.0,
		"y": 504.0
	},
	"DoorFourLoc": {
		"One": {
			"x": 1096.0,
			"y": 504.0
		},
		"Two": {
			"x": 1464.0,
			"y": 504.0
		}
	},
	"DoorFiveLoc": {
		"x": 504.0,
		"y": 664.0
	},
	"DoorSixLoc": {
		"x": 1000.0,
		"y": 664.0
	},
	"DoorSevenLoc": {
		"One": {
			"x": 408.0,
			"y": 1000.0
		},
		"Two": {
			"x": 504.0,
			"y": 1224.0
		}
	},
	"DoorEightLoc": {
		"x": 600.0,
		"y": 1000.0
	},
	"DoorNineLoc": {
		"x": 904.0,
		"y": 1000.0
	},
	"DoorTenLoc": {
		"x": 1224.0,
		"y": 1000.0
	},
	"DoorElevenLoc": {
		"x": 1288.0,
		"y": 1000.0
	},
	"DoorTwelveLoc": {
		"x": 1000.0,
		"y": 1352.0
	}
}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DoorDirection == "Horizontal":
		door_direction.frame = 0
		vertical.disabled = true
		horizontal.disabled = false
	if DoorDirection == "Vertical":
		door_direction.frame = 1
		vertical.disabled = false
		horizontal.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Opened == true:
		self.visible = false
		if DoorDirection == "Vertical":
			vertical.disabled = true
		if DoorDirection == "Horizontal":
			horizontal.disabled = true
	else:
		self.visible = true
		if DoorDirection == "Vertical":
			vertical.disabled = false
		if DoorDirection == "Horizontal":
			horizontal.disabled = false
