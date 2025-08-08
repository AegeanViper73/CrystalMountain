extends CharacterBody2D
var PlayerMoveSpeed: int = 400
@onready var player_cam: Camera2D = $Camera2D


#Camera Boder Settings
var Cam_LeftBorder:   int
var Cam_RightBorder:  int
var Cam_TopBorder:    int
var Cam_BottomBorder: int
var Cam_BordersReset: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Cam_BordersReset == true:
		player_cam.limit_left   = Cam_LeftBorder
		player_cam.limit_right  = Cam_RightBorder
		player_cam.limit_top    = Cam_TopBorder
		player_cam.limit_bottom = Cam_BottomBorder
		Cam_BordersReset = false


func _physics_process(delta: float) -> void:
	var PlayerMoveX = Input.get_axis("MoveLeft","MoveRight")
	var PlayerMoveY = Input.get_axis("MoveUp","MoveDown")
	velocity = Vector2(PlayerMoveX,PlayerMoveY) * PlayerMoveSpeed
	move_and_slide()
