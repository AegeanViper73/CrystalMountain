extends Node2D
@export_category("Stair Attributes")
@export var StairDirection: Dictionary[String,String] = {}
@export_enum("One","Two","Three","Four","Five",
			 "Six","Seven","Eight","Nine","Ten",
			 "Eleven","Twelve","Exit") var WhichDoor: String
@export var Coords: Dictionary[String,Vector2] = {}
@export var SetKeys: Node
var PickSpot: int = randi_range(0,1)
var SpotPicked: int
#var StairDirection: int
@onready var stair_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Place Stair object based on corresponding Door
	if WhichDoor == "One":
		position = Coords["SpotOne"]
		SpotPicked = 0
	elif WhichDoor == "Two":
		position = Coords["SpotOne"]
		SpotPicked = 0
	elif WhichDoor == "Three":
		position = Coords["SpotOne"]
		SpotPicked = 0
	elif WhichDoor == "Four":
		if PickSpot == 0:
			position = Coords["SpotOne"]
			SpotPicked = 0
		elif PickSpot == 1:
			position = Coords["SpotTwo"]
			SpotPicked = 1
	elif WhichDoor == "Five":
		position = Coords["SpotOne"]
		SpotPicked = 0
	elif WhichDoor == "Six":
		if PickSpot == 0:
			position = Coords["SpotOne"]
			SpotPicked = 0
		elif PickSpot == 1:
			position = Coords["SpotTwo"]
			SpotPicked = 1
	elif WhichDoor == "Seven":
		if PickSpot == 0:
			position = Coords["SpotOne"]
			SpotPicked = 0
		elif PickSpot == 1:
			position = Coords["SpotTwo"]
			SpotPicked = 1
	elif WhichDoor == "Eight":
		position = Coords["SpotOne"]
		SpotPicked = 0
	elif WhichDoor == "Nine":
		position = Coords["SpotOne"]
		SpotPicked = 0
	elif WhichDoor == "Ten":
		if PickSpot == 0:
			position = Coords["SpotOne"]
			SpotPicked = 0
		elif PickSpot == 1:
			position = Coords["SpotTwo"]
			SpotPicked = 1
	elif WhichDoor == "Eleven":
		if PickSpot == 0:
			position = Coords["SpotOne"]
			SpotPicked = 0
		elif PickSpot == 1:
			position = Coords["SpotTwo"]
			SpotPicked = 1
	elif WhichDoor == "Twelve":
		position = Coords["SpotOne"]
		SpotPicked = 0
	elif WhichDoor == "Exit":
		pass
	#Orient Stair object
	if SpotPicked == 0:
		if StairDirection["SpotOne"] == "Left":
			stair_sprite.frame = 0
		elif StairDirection["SpotOne"] == "Right":
			stair_sprite.frame = 1
		elif StairDirection["SpotOne"] == "Up":
			stair_sprite.frame = 2
		elif StairDirection["SpotOne"] == "Down":
			stair_sprite.frame = 3
	elif SpotPicked == 1:
		if StairDirection["SpotTwo"] == "Left":
			stair_sprite.frame = 0
		elif StairDirection["SpotTwo"] == "Right":
			stair_sprite.frame = 1
		elif StairDirection["SpotTwo"] == "Up":
			stair_sprite.frame = 2
		elif StairDirection["SpotTwo"] == "Down":
			stair_sprite.frame = 3
	


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if WhichDoor == "One":
		SetKeys.Keys["One"] = true
	elif WhichDoor == "Two":
		SetKeys.Keys["Two"] = true
	elif WhichDoor == "Three":
		SetKeys.Keys["Three"] = true
	elif WhichDoor == "Four":
		SetKeys.Keys["Four"] = true
	elif WhichDoor == "Five":
		SetKeys.Keys["Five"] = true
	elif WhichDoor == "Six":
		SetKeys.Keys["Six"] = true
	elif WhichDoor == "Seven":
		SetKeys.Keys["Seven"] = true
	elif WhichDoor == "Eight":
		SetKeys.Keys["Eight"] = true
	elif WhichDoor == "Nine":
		SetKeys.Keys["Nine"] = true
	elif WhichDoor == "Ten":
		SetKeys.Keys["Ten"] = true
	elif WhichDoor == "Eleven":
		SetKeys.Keys["Eleven"] = true
	elif WhichDoor == "Twelve":
		SetKeys.Keys["Twelve"] = true
	
