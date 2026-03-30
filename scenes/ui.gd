extends CanvasLayer

@onready var fear_bar := $FearBar
@onready var vignette := $Vignette

var death_label: Label

func _ready() -> void:
	death_label = Label.new()
	death_label.text = "YOU COLLAPSED"
	death_label.position = Vector2(400, 300)
	death_label.z_index = 100
	add_child(death_label)
	death_label.visible = false

func _process(_delta: float) -> void:
	var ratio := GameState.fear_ratio()
	fear_bar.value = ratio * 100.0
	
	if not GameState.run_active:
		death_label.visible = true
	else:
		vignette.color.a = ratio * 0.6
