extends CharacterBody2D
const PlayerSpeed := 60
const GravityMax := 400.0
var Gravity := 1500.0
const JumpHeight := -425.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	
	#Add Gravity to the Player
	if not is_on_floor():
		if(velocity.y < GravityMax):
			velocity.y += Gravity * delta
		else:
			velocity.y = GravityMax
	
	#Player movement code
	var Direction := Input.get_axis("MoveLeft","MoveRight")
	if is_on_floor():
		if Input.is_action_pressed("Jump"):
			velocity.y = JumpHeight
	
	velocity.x = Direction * PlayerSpeed
	move_and_slide()
