extends Node

var fear: float = 0.0
var fear_max: float = 100.0
var run_active: bool = true

func reset_run() -> void:
	fear = 0.0
	run_active = true

func add_fear(amount: float) -> void:
	if not run_active:
		return
	fear = clamp(fear + amount, 0.0, fear_max)
	if fear >= fear_max:
		run_active = false

func fear_ratio() -> float:
	return fear / fear_max
