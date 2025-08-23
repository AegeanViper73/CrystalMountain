extends Node2D

@onready var player_free_move: CharacterBody2D = %PlayerFreeMove


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_start_data = PlayerData.new()
	player_free_move.position = player_start_data.PlayerPosition
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
