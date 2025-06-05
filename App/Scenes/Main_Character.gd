extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
@onready var camera_2d = %camera_2d
@onready var sprite_2d = $Sprite2D
@onready var timer = %Timer

var jump_label

var accum = 0
var itera = 0
var conta = 0
var maxim = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func CameraMove():
	itera = 0
	conta = 0
	accum = 0
	timer.start()
func _ready():
	jump_label = get_node("/root/Ui/Sprite2D/JumpLabel")


func _physics_process(delta):
	if abs(velocity.x)>1:
		sprite_2d.animation="Running";
	else:
		sprite_2d.animation="idle";
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation="jump"
		
	if Input.is_action_just_pressed("Recorrido"):
		CameraMove()
	
	if Input.is_action_just_pressed("Saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_label.text= str(int(jump_label.text)+1)
		
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("zoomIn"):
		if(camera_2d.zoom<=Vector2(2,2)):
			camera_2d.zoom=camera_2d.zoom+Vector2(.5,.5)
	if Input.is_action_just_pressed("zoomOut"):
		if(camera_2d.zoom>=Vector2(.5,.5)):
			camera_2d.zoom=camera_2d.zoom-Vector2(.5,.5)
	

	move_and_slide()
	var isLeft = velocity.x <0;
	sprite_2d.flip_h=isLeft;


func _on_timer_timeout():
	if ( itera <= maxim ):
		accum = 40 + accum
		camera_2d.position = Vector2(accum, 0 )
		itera = itera + 1
	if ( itera >  maxim):
		if ( camera_2d.position > Vector2(0,0) ):
			accum = -40 + accum
			camera_2d.position = Vector2( accum, 0 )
			conta = conta + 1
			if ( conta == maxim):
				timer.stop()
				camera_2d.drag_horizontal_enabled = true


