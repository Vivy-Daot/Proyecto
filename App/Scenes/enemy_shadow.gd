extends CharacterBody2D
const Speed = 100.0
const Gravity = 980

func _ready():
	velocity.x = Speed
	$AnimatedSprite2D.play("Run")
	
func flip():
	if  $Left.is_colliding() or $Right.is_colliding() or $Diagonal.is_colliding() == false:
		velocity.x*=-1
		$AnimatedSprite2D.scale.x *=-1

func _physics_process(delta):
	velocity.y *= Gravity
	flip()
	move_and_slide()
