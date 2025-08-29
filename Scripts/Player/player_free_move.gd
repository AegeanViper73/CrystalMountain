extends CharacterBody2D
var PlayerMoveSpeed: int = 200
@onready var player_cam: Camera2D = $Camera2D
@onready var player_anim: AnimatedSprite2D = $AnimatedSprite2D


#Camera Boder Settings
var Cam_LeftBorder:   int
var Cam_RightBorder:  int
var Cam_TopBorder:    int
var Cam_BottomBorder: int
var Cam_BordersReset: bool = false




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		SaveFileTracker.IsGamePaused = !SaveFileTracker.IsGamePaused
	#Animate Player
	if SaveFileTracker.IsGamePaused == false:
		var PlayerX = Input.get_axis("MoveLeft","MoveRight")
		var PlayerY = Input.get_axis("MoveUp","MoveDown")
		if (PlayerX != 0 and PlayerY == 0) or (PlayerX == 0 and PlayerY != 0):
			player_anim.play("Straight")
			if PlayerY > 0:
				self.rotation_degrees = 0
			elif PlayerY < 0:
				self.rotation_degrees = 180
			if PlayerX < 0:
				self.rotation_degrees = 90
			if PlayerX > 0:
				self.rotation_degrees = 270
		if (PlayerX !=0 and PlayerY != 0):
			player_anim.play("Diagonal")
			if PlayerX > 0 and PlayerY > 0:
				self.rotation_degrees = 0
			if PlayerX > 0 and PlayerY < 0:
				self.rotation_degrees = 270
			if PlayerX < 0 and PlayerY > 0:
				self.rotation_degrees = 90
			if PlayerX < 0 and PlayerY < 0:
				self.rotation_degrees = 180
	
	if Cam_BordersReset == true:
		player_cam.limit_left   = Cam_LeftBorder
		player_cam.limit_right  = Cam_RightBorder
		player_cam.limit_top    = Cam_TopBorder
		player_cam.limit_bottom = Cam_BottomBorder
		Cam_BordersReset = false
	
	


func _physics_process(_delta: float) -> void:
	if SaveFileTracker.IsGamePaused == false:
		var PlayerMoveX = Input.get_axis("MoveLeft","MoveRight")
		var PlayerMoveY = Input.get_axis("MoveUp","MoveDown")
		velocity = round(Vector2(PlayerMoveX,PlayerMoveY) * PlayerMoveSpeed)
		move_and_slide()


#func _on_area_2d_body_entered(body: Node2D) -> void:
	#print(body.GoToLevel)
