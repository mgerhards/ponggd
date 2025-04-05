extends StaticBody2D

@export var speed := 400.0
@export var is_player_one := false

func _process(delta):
	var input_dir := 0
	if is_player_one:
		input_dir = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	else:
		input_dir = Input.get_action_strength("p2_down") - Input.get_action_strength("p2_up")

	position.y += input_dir * speed * delta
	
	if position.y < 0:
		position.y = 0
	
	if position.y > 650:
		position.y=650
