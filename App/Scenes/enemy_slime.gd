extends CharacterBody2D
const Speed = 100.0
const Gravity = 980
const JumpPower = -700
var nJumps =1

func _ready():
	$AnimatedSprite2D.play("Idle")
	
func nearPlayer():
	return $Near.is_colliding()

func seePlayer():
	return $Right.is_colliding()

func move():
	velocity.x = -Speed
	$AnimatedSprite2D.play("Run")

func jump():
	if nJumps > 0:
		velocity.y = JumpPower

func _physics_process(delta):
	velocity.y *= Gravity
	if not is_on_floor():
		velocity.y += Gravity * delta
	if is_on_floor():
		nJumps =1
		if velocity.x > 0:
			$AnimatedSprite2D.play("Run")
		elif velocity.x == 0:
			$AnimatedSprite2D.play("Idle")
	if seePlayer():
		move()
	if nearPlayer():
		jump()
	move_and_slide()
	

	move_and_slide()
