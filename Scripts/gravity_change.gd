extends Node2D
@export_enum("Left","Right","Up","Down") var GravityDirection: String
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GravityDirection == "Left":
		animated_sprite_2d.play("Left")
	elif GravityDirection == "Right":
		animated_sprite_2d.play("Right")
	elif GravityDirection == "Up":
		animated_sprite_2d.play("Up")
	elif GravityDirection == "Down":
		animated_sprite_2d.play("Down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if GravityDirection == "Left":
		body.GravityDirection = "Left"
	elif GravityDirection == "Right":
		body.GravityDirection = "Right"
	elif GravityDirection == "Up":
		body.GravityDirection = "Up"
	elif GravityDirection == "Down":
		body.GravityDirection = "Down"
