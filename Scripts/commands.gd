extends Node
var OriginalTimeScale := Engine.time_scale

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause") and Engine.time_scale != 0:
		#Pause the Game
		OriginalTimeScale = Engine.time_scale
		Engine.time_scale = 0
	elif Input.is_action_just_pressed("Pause") and Engine.time_scale == 0:
		#Unpause the Game
		Engine.time_scale = OriginalTimeScale
