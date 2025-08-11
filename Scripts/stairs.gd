extends Node2D
@export_category("Stairs Features")
@export_enum("Left","Right","Up","Down") var FacingDirection_Pick: String
@export_enum("none","TR_B","BR_TR") var CorrespondingDoor: String
#@export var NumberOfLocations: int
var FacingDirection: String

#var LocationPick = randi_range(1,NumberOfLocations)

var OpenDoor: bool = false

@onready var stairs_direction: AnimatedSprite2D = $Stairs_Direction



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if FacingDirection == "Left":
		stairs_direction.frame = 0
	elif FacingDirection == "Right":
		stairs_direction.frame = 1
	elif FacingDirection == "Up":
		stairs_direction.frame = 2
	elif FacingDirection == "Down":
		stairs_direction.frame = 3
	else:
		if FacingDirection_Pick == "Right":
			stairs_direction.frame = 1
		elif FacingDirection_Pick == "Up":
			stairs_direction.frame = 2
		elif FacingDirection_Pick == "Down":
			stairs_direction.frame = 3
		else:
			stairs_direction.frame = 0


func _on_area_2d_body_entered(_body: Node2D) -> void:
	OpenDoor = true
	print("Fuck You")
	#if DoorToOpen == TM_L:
		#pass #Open Bottom Left door in Top Middle Room
