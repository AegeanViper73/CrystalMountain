extends Control
var ParentRotation_Now: float
var ParentRotation_Prev: float

var DisplayMenu: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#region DO NOT ROTATE MENU
	ParentRotation_Prev = ParentRotation_Now
	ParentRotation_Now = get_parent().rotation_degrees
	var ResetRotation: bool
	if ParentRotation_Prev != ParentRotation_Now:
		ResetRotation = true
	if ResetRotation == true:
		rotation_degrees = -get_parent().rotation_degrees
		ResetRotation = false
	#endregion
	if get_parent().IsPaused == true:
		visible = true
	else:
		visible = false
