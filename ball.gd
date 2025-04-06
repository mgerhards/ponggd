extends CharacterBody2D


const JUMP_VELOCITY = -400.0
var direction := Vector2(1,0).rotated(randf_range(-0.2,0.2))
var speed = 300.0

func _ready():
	randomize()

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		$HitSound.play(0.0)
		direction = direction.bounce(collision.get_normal()).normalized()
	
	if position.y < 0 or position.y > get_viewport_rect().size.y:
		direction.y = -direction.y

func bounce(normal: Vector2):
	print("bounce..")
	
	direction = direction.bounce(normal).normalized()
	
func resetSpeed():
	speed = 300.0;	
	
func incSpeed():
	speed = speed*1.25;
