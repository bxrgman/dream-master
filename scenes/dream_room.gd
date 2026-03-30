extends Node2D

var elapsed := 0.0
var decay_stage := 0

func _process(delta: float) -> void:
	if not GameState.run_active:
		return
	
	elapsed += delta
	
	var target_stage := 0
	
	if elapsed > 10.0 or GameState.fear_ratio() > 0.3:
		target_stage = 1
	if elapsed > 22.0 or GameState.fear_ratio() > 0.65:
		target_stage = 2
	
	if target_stage != decay_stage:
		decay_stage = target_stage
		apply_decay_stage()

func apply_decay_stage() -> void:
	match decay_stage:
		0:
			pass
		1:
			$Background.modulate = Color(0.8, 0.8, 0.9)
		2:
			$Background.modulate = Color(0.55, 0.5, 0.6)
