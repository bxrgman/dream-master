extends CharacterBody2D

@export var speed: float = 160.0
@export var jump_velocity: float = -300.0
@export var gravity_scale: float = 0.85
@export var attack_push_radius: float = 48.0

var facing := 1
var can_control := true

func _physics_process(delta: float) -> void:
	if not can_control:
		return
	
	var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity") * gravity_scale
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	var dir := Input.get_axis("move_left", "move_right")
	if dir != 0:
		facing = sign(dir)
	velocity.x = dir * speed
	
	if Input.is_action_just_pressed("attack"):
		do_attack_pulse()
	
	move_and_slide()

func do_attack_pulse() -> void:
	for body in get_tree().get_nodes_in_group("pushable_threats"):
		if body is Node2D and global_position.distance_to(body.global_position) <= attack_push_radius:
			if body.has_method("push_back"):
				body.push_back(global_position)

func get_facing_dir() -> int:
	return facing
