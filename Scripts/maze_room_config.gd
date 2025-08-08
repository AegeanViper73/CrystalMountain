extends Area2D
@export_group("Room Borders")
@export var Cam_LeftBorder:   int
@export var Cam_RightBorder:  int
@export var Cam_TopBorder:    int
@export var Cam_BottomBorder: int


func _on_body_entered(body: Node2D) -> void:
	body.Cam_LeftBorder   = Cam_LeftBorder
	body.Cam_RightBorder  = Cam_RightBorder
	body.Cam_TopBorder    = Cam_TopBorder
	body.Cam_BottomBorder = Cam_BottomBorder
	body.Cam_BordersReset = true
