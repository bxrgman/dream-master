extends Node2D

signal bedroom_exit

@onready var shadow_timer := $ShadowTimer
var exit_open := false

func _ready() -> void:
	shadow_timer.connect("timeout", Callable(self, "_on_shadow_timer_timeout"))
	shadow_timer.start()

func _on_shadow_timer_timeout() -> void:
	exit_open = true

func _process(delta: float) -> void:
	if exit_open:
		GameState.add_fear(10.0 * delta)
