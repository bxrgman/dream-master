extends Node2D

@onready var player := $Nemo

func _ready() -> void:
	GameState.reset_run()
	player.add_to_group("player")

func _process(_delta: float) -> void:
	if not GameState.run_active and Input.is_action_just_pressed("interact"):
		get_tree().reload_current_scene()
