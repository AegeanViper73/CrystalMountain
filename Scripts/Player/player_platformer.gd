extends CharacterBody2D

#Declare Horizontal Movement Components
const PlayerSpeed:   int   = 120
var MovingSpeed:     float 
var PlayerRun:       float
var DirectionFacing: int   = 1
var CanMovePlayer:   bool  = true

#Declare Vertical Movement Components
const JumpHeight:    float = -400
const GravityLimit:  float =  400
const GravityAdd:    float =  1500
var   CanJump:       bool

#Link Nodes For Use Reference
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	if is_on_floor():
		CanJump = true
		coyote_timer.start()
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
		if Input.is_action_pressed("Run"):
			PlayerRun = 1.5
		else:
			PlayerRun = 1
		
		velocity.x = MovingSpeed * PlayerSpeed * PlayerRun
	
	
	
	move_and_slide()


#CanJump = false # --> in coyote timer func


func _on_coyote_timer_timeout() -> void:
	CanJump = false
