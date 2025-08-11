extends Node2D
@export_enum("Vertical","Horizontal") var DoorDirection: String
@export var SignalStair: Node2D
var Opened: bool = false
var LocationPick: int = 1

@onready var door_direction: AnimatedSprite2D = $AnimatedSprite2D
@onready var vertical: CollisionShape2D = $StaticBody2D/Vertical
@onready var horizontal: CollisionShape2D = $StaticBody2D/Horizontal



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
	
	#Set Locations of Stairs when there are multiple possibilities
	
	if SignalStair.CorrespondingDoor == "TR_B":
		SignalStair.FacingDirection = "Right"
		LocationPick = randi_range(1,2)
		if LocationPick == 1:
			SignalStair.position = Vector2(-360,-152)
		elif LocationPick == 2:
			SignalStair.position = Vector2(-24,424)
	elif SignalStair.CorrespondingDoor == "BR_TR":
		LocationPick = randi_range(1,2)
		if LocationPick == 1:
			SignalStair.position = Vector2(-728,104)
			SignalStair.FacingDirection = "Up"
		elif LocationPick == 2:
			SignalStair.position = Vector2(-152,664)
			SignalStair.FacingDirection = "Left"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if SignalStair == null:
		print("Assign this door a Signal")
	else:
		if SignalStair.OpenDoor == true:
			Opened = true
	
	
	
	if Opened == true:
		self.queue_free()
