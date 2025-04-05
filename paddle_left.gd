extends CharacterBody2D

@export var speed := 400.0
@export var is_player_one := false

func _physics_process(delta):
	var input_dir := 0
	if is_player_one:
		input_dir = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	else:
		input_dir = Input.get_action_strength("p2_up") - Input.get_action_strength("p2_down")

	velocity = Vector2(0, input_dir * speed)
	move_and_slide()
