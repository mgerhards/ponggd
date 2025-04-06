extends Node2D

@onready var ball := $Ball
@onready var paddle_left := $PaddleLeft
@onready var paddle_right := $PaddleRight
@onready var speedTimer := $SpeedTimer
@onready var p1ScoreLabel := $UI/P1ScoreLabel
@onready var p2ScoreLabel := $UI/P2ScoreLabel

var p1_score = -1
var p2_score = -2	



func _process(_delta):
	if ball.position.x < 0 or ball.position.x > get_viewport_rect().size.x:
		reset_ball()

func reset_ball():
	print("Reset ball...")
	ball.position = get_viewport_rect().size / 2
	ball.direction = Vector2(-1 if randf() > 0.5 else 1, randf_range(-0.5, 0.5)).normalized()
	ball.resetSpeed()
	print("Score: P1: %d P2: %d" % [p1_score, p2_score])
	p1ScoreLabel.text = "%d" % p1_score
	p2ScoreLabel.text = "%d" % p2_score

func _on_wall_left_body_entered(body: Node2D) -> void:
	$EventLooseSound.play()
	print("Point for P1 " + body.name)			
	p1_score += 1
	print("Player 1 scores! Score:", p1_score)
	reset_ball()


func _on_wall_right_body_entered(body: Node2D) -> void:
	$EventLooseSound.play()
	print("Point for P2 " + body.name)			
	p2_score += 1
	print("Player 2 scores! Score:", p2_score)
	reset_ball()

func _on_speed_timer_timeout() -> void:
	
	print("Speed increase")
	ball.incSpeed()
	speedTimer.start(5)
	
