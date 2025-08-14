extends CharacterBody2D

#Declare Horizontal Movement Components
const PlayerSpeedIncrease: int = 50
const PlayerSpeedMax:      float = 190
var PlayerSpeed:           float
var MovingSpeed:           float 
var PlayerRun:             float
var DirectionFacing:       int   = 1
var CanMovePlayer:         bool  = true

#Declare Vertical Movement Components
const JumpHeight:    float = -400
const GravityLimit:  float =  400
const GravityAdd:    float =  1500
var   CanJump:       bool

var GravityDirection: String = "Down"

#Link Nodes For Use Reference
@onready var player_animated: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var detect: Area2D = $Detect
@onready var player_cam: Camera2D = $Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GravityDirection == "Left":
		self.rotation_degrees = 90
	elif GravityDirection == "Right":
		self.rotation_degrees = 270
	elif GravityDirection == "Up":
		self.rotation_degrees = 180
	elif GravityDirection == "Down":
		self.rotation_degrees = 0
	
	if Input.is_action_just_pressed("ChangeCameraFix"):
		if player_cam.ignore_rotation == true:
			player_cam.ignore_rotation = false
		else: player_cam.ignore_rotation = true
	


func _physics_process(delta: float) -> void:
	#region Player Camera Rotates w/ Player
	if player_cam.ignore_rotation == false:
		if GravityDirection == "Down":
			if is_on_floor():
				CanJump = true
				#coyote_timer.start()
			else:
				
				if velocity.y < GravityLimit:
					velocity.y += GravityAdd * delta
				else:
					velocity.y = GravityLimit
			
			if CanJump == true:
				if Input.is_action_just_pressed("Jump"):
					velocity.y = JumpHeight
			
			if CanMovePlayer == true:
				#Set Movement Speed Of Player
				MovingSpeed = Input.get_axis("MoveLeft","MoveRight")
				#Check If Player Is Trying To Run
				if Input.is_action_pressed("Run"): PlayerRun = 1.5
				else: PlayerRun = 1
				
				if velocity.x != PlayerSpeed:
					PlayerSpeed = 0
				
				if MovingSpeed != 0:
					PlayerSpeed += PlayerSpeedIncrease * MovingSpeed
					if PlayerSpeed > (PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (PlayerSpeedMax * PlayerRun)
						DirectionFacing = 1
					if PlayerSpeed < (-PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (-PlayerSpeedMax * PlayerRun)
						DirectionFacing = -1
				else:
					if PlayerSpeed != 0:
						PlayerSpeed = move_toward(PlayerSpeed,0,PlayerSpeedIncrease)
					else:
						pass
				velocity.x = round(PlayerSpeed)
		
		if GravityDirection == "Up":
			if is_on_ceiling():
				CanJump = true
				#coyote_timer.start()
			else:
				
				if velocity.y > -GravityLimit:
					velocity.y -= GravityAdd * delta
				else:
					velocity.y = -GravityLimit
			
			if CanJump == true:
				if Input.is_action_just_pressed("Jump"):
					velocity.y = -JumpHeight
			
			if CanMovePlayer == true:
				#Set Movement Speed Of Player
				MovingSpeed = Input.get_axis("MoveRight","MoveLeft")
				#Check If Player Is Trying To Run
				if Input.is_action_pressed("Run"): PlayerRun = 1.5
				else: PlayerRun = 1
				
				if velocity.x != PlayerSpeed:
					PlayerSpeed = 0
				
				if MovingSpeed != 0:
					PlayerSpeed += PlayerSpeedIncrease * MovingSpeed
					if PlayerSpeed > (PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (PlayerSpeedMax * PlayerRun)
						DirectionFacing = 1
					if PlayerSpeed < (-PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (-PlayerSpeedMax * PlayerRun)
						DirectionFacing = -1
				else:
					if PlayerSpeed != 0:
						PlayerSpeed = move_toward(PlayerSpeed,0,PlayerSpeedIncrease)
					else:
						pass
				velocity.x = round(PlayerSpeed)
		
		if GravityDirection == "Right":
			if is_on_wall() and get_slide_collision(0).get_position().x > position.x: #This extra bit prevents sticking to "ceiling"
				CanJump = true
				#coyote_timer.start()
			else:
				
				if velocity.x < GravityLimit:
					velocity.x += GravityAdd * delta
				else:
					velocity.x = GravityLimit
			
			if CanJump == true:
				if Input.is_action_just_pressed("Jump"):
					velocity.x = JumpHeight
			
			if CanMovePlayer == true:
				#Set Movement Speed Of Player
				MovingSpeed = Input.get_axis("MoveRight","MoveLeft")
				#Check If Player Is Trying To Run
				if Input.is_action_pressed("Run"): PlayerRun = 1.5
				else: PlayerRun = 1
				
				if velocity.y != PlayerSpeed:
					PlayerSpeed = 0
				
				if MovingSpeed != 0:
					PlayerSpeed += PlayerSpeedIncrease * MovingSpeed
					if PlayerSpeed > (PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (PlayerSpeedMax * PlayerRun)
						DirectionFacing = 1
					if PlayerSpeed < (-PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (-PlayerSpeedMax * PlayerRun)
						DirectionFacing = -1
				else:
					if PlayerSpeed != 0:
						PlayerSpeed = move_toward(PlayerSpeed,0,PlayerSpeedIncrease)
					else:
						pass
				velocity.y = round(PlayerSpeed)
		
		if GravityDirection == "Left":
			if is_on_wall() and get_slide_collision(0).get_position().x < position.x: #This extra bit prevents sticking to "ceiling"
				CanJump = true
				#coyote_timer.start()
			else:
				
				if velocity.x > -GravityLimit:
					velocity.x -= GravityAdd * delta
				else:
					velocity.x = -GravityLimit
			
			if CanJump == true:
				if Input.is_action_just_pressed("Jump"):
					velocity.x = -JumpHeight
			
			if CanMovePlayer == true:
				#Set Movement Speed Of Player
				MovingSpeed = Input.get_axis("MoveLeft","MoveRight")
				#Check If Player Is Trying To Run
				if Input.is_action_pressed("Run"): PlayerRun = 1.5
				else: PlayerRun = 1
				
				if velocity.y != PlayerSpeed:
					PlayerSpeed = 0
				
				if MovingSpeed != 0:
					PlayerSpeed += PlayerSpeedIncrease * MovingSpeed
					if PlayerSpeed > (PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (PlayerSpeedMax * PlayerRun)
						DirectionFacing = 1
					if PlayerSpeed < (-PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (-PlayerSpeedMax * PlayerRun)
						DirectionFacing = -1
				else:
					if PlayerSpeed != 0:
						PlayerSpeed = move_toward(PlayerSpeed,0,PlayerSpeedIncrease)
					else:
						pass
				velocity.y = round(PlayerSpeed)
	#endregion
	#region Player Cam does not Rotate w/ Player
	if player_cam.ignore_rotation == true:
		if GravityDirection == "Down":
			if is_on_floor():
				CanJump = true
				#coyote_timer.start()
			else:
				
				if velocity.y < GravityLimit:
					velocity.y += GravityAdd * delta
				else:
					velocity.y = GravityLimit
			
			if CanJump == true:
				if Input.is_action_just_pressed("Jump"):
					velocity.y = JumpHeight
			
			if CanMovePlayer == true:
				#Set Movement Speed Of Player
				MovingSpeed = Input.get_axis("MoveLeft","MoveRight")
				#Check If Player Is Trying To Run
				if Input.is_action_pressed("Run"): PlayerRun = 1.5
				else: PlayerRun = 1
				
				if velocity.x != PlayerSpeed:
					PlayerSpeed = 0
				
				if MovingSpeed != 0:
					PlayerSpeed += PlayerSpeedIncrease * MovingSpeed
					if PlayerSpeed > (PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (PlayerSpeedMax * PlayerRun)
						DirectionFacing = 1
					if PlayerSpeed < (-PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (-PlayerSpeedMax * PlayerRun)
						DirectionFacing = -1
				else:
					if PlayerSpeed != 0:
						PlayerSpeed = move_toward(PlayerSpeed,0,PlayerSpeedIncrease)
					else:
						pass
				velocity.x = round(PlayerSpeed)
		
		if GravityDirection == "Up":
			if is_on_ceiling():
				CanJump = true
				#coyote_timer.start()
			else:
				
				if velocity.y > -GravityLimit:
					velocity.y -= GravityAdd * delta
				else:
					velocity.y = -GravityLimit
			
			if CanJump == true:
				if Input.is_action_just_pressed("Jump"):
					velocity.y = -JumpHeight
			
			if CanMovePlayer == true:
				#Set Movement Speed Of Player
				MovingSpeed = Input.get_axis("MoveLeft","MoveRight")
				#Check If Player Is Trying To Run
				if Input.is_action_pressed("Run"): PlayerRun = 1.5
				else: PlayerRun = 1
				
				if velocity.x != PlayerSpeed:
					PlayerSpeed = 0
				
				if MovingSpeed != 0:
					PlayerSpeed += PlayerSpeedIncrease * MovingSpeed
					if PlayerSpeed > (PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (PlayerSpeedMax * PlayerRun)
						DirectionFacing = 1
					if PlayerSpeed < (-PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (-PlayerSpeedMax * PlayerRun)
						DirectionFacing = -1
				else:
					if PlayerSpeed != 0:
						PlayerSpeed = move_toward(PlayerSpeed,0,PlayerSpeedIncrease)
					else:
						pass
				velocity.x = round(PlayerSpeed)
		
		if GravityDirection == "Right":
			if is_on_wall() and get_slide_collision(0).get_position().x > position.x: #This extra bit prevents sticking to "ceiling"
				CanJump = true
				#coyote_timer.start()
			else:
				
				if velocity.x < GravityLimit:
					velocity.x += GravityAdd * delta
				else:
					velocity.x = GravityLimit
			
			if CanJump == true:
				if Input.is_action_just_pressed("Jump"):
					velocity.x = JumpHeight
			
			if CanMovePlayer == true:
				#Set Movement Speed Of Player
				MovingSpeed = Input.get_axis("MoveUp","MoveDown")
				#Check If Player Is Trying To Run
				if Input.is_action_pressed("Run"): PlayerRun = 1.5
				else: PlayerRun = 1
				
				if velocity.y != PlayerSpeed:
					PlayerSpeed = 0
				
				if MovingSpeed != 0:
					PlayerSpeed += PlayerSpeedIncrease * MovingSpeed
					if PlayerSpeed > (PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (PlayerSpeedMax * PlayerRun)
						DirectionFacing = 1
					if PlayerSpeed < (-PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (-PlayerSpeedMax * PlayerRun)
						DirectionFacing = -1
				else:
					if PlayerSpeed != 0:
						PlayerSpeed = move_toward(PlayerSpeed,0,PlayerSpeedIncrease)
					else:
						pass
				velocity.y = round(PlayerSpeed)
		
		if GravityDirection == "Left":
			if is_on_wall() and get_slide_collision(0).get_position().x < position.x: #This extra bit prevents sticking to "ceiling"
				CanJump = true
				#coyote_timer.start()
			else:
				
				if velocity.x > -GravityLimit:
					velocity.x -= GravityAdd * delta
				else:
					velocity.x = -GravityLimit
			
			if CanJump == true:
				if Input.is_action_just_pressed("Jump"):
					velocity.x = -JumpHeight
			
			if CanMovePlayer == true:
				#Set Movement Speed Of Player
				MovingSpeed = Input.get_axis("MoveUp","MoveDown")
				#Check If Player Is Trying To Run
				if Input.is_action_pressed("Run"): PlayerRun = 1.5
				else: PlayerRun = 1
				
				if velocity.y != PlayerSpeed:
					PlayerSpeed = 0
				
				if MovingSpeed != 0:
					PlayerSpeed += PlayerSpeedIncrease * MovingSpeed
					if PlayerSpeed > (PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (PlayerSpeedMax * PlayerRun)
						DirectionFacing = 1
					if PlayerSpeed < (-PlayerSpeedMax * PlayerRun):
						PlayerSpeed = (-PlayerSpeedMax * PlayerRun)
						DirectionFacing = -1
				else:
					if PlayerSpeed != 0:
						PlayerSpeed = move_toward(PlayerSpeed,0,PlayerSpeedIncrease)
					else:
						pass
				velocity.y = round(PlayerSpeed)
	#endregion
	move_and_slide()


func _on_coyote_timer_timeout() -> void:
	CanJump = false
#region Gavity Zone Checks
func _on_detect_body_entered(body: Node2D) -> void:
	GravityDirection = "Left"
	CanJump = false

func _on_detect_grav_r_body_entered(body: Node2D) -> void:
	GravityDirection = "Right"
	CanJump = false

func _on_detect_grav_u_body_entered(body: Node2D) -> void:
	GravityDirection = "Up"
	CanJump = false

func _on_detect_grav_d_body_entered(body: Node2D) -> void:
	GravityDirection = "Down"
	CanJump = false
#endregion
