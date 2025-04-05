extends Node2D

@onready var ball := $Ball
@onready var paddle_left := $PaddleLeft
@onready var paddle_right := $PaddleRight


func _process(_delta):
	if ball.position.x < 0 or ball.position.x > get_viewport_rect().size.x:
		reset_ball()

func reset_ball():
	ball.position = get_viewport_rect().size / 2
	ball.direction = Vector2(-1 if randf() > 0.5 else 1, randf_range(-0.5, 0.5)).normalized()
