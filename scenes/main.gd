extends Node2D

@onready var player := $Nemo
@onready var bedroom := $Bedroom

var dream_scene := preload("res://scenes/DreamRoom_01.tscn")

func _ready() -> void:
	GameState.reset_run()
	player.add_to_group("player")
	bedroom.connect("bedroom_exit", Callable(self, "_on_bedroom_exit"))

func _on_bedroom_exit() -> void:
	bedroom.queue_free()
	var dream = dream_scene.instantiate()
	add_child(dream)
	player.global_position = dream.get_node("SpawnPoint").global_position

func _process(_delta: float) -> void:
	if not GameState.run_active and Input.is_action_just_pressed("interact"):
		get_tree().reload_current_scene()
