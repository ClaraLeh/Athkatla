extends KinematicBody2D

var casting = false
var direction = Vector2()

func _ready():
	pass
	# set_physics_process(true)
	# set_process(true)
	
	#$spr.frame = 3

func _process(delta):
	# first cast
	if Input.is_key_pressed(KEY_A) and $Cast.is_stopped() and casting == false:
		$charanim.current_animation = "Cast_NW"
		casting = true
	elif !$Cast.is_stopped() and casting:
		$charanim.current_animation = "Cast_NW"
		pass
	elif $Cast.is_stopped() and casting:
		#castspell
		pass
		#casting = false

func _physics_process(delta):
	_move(delta)

func _move(delta):
	direction.x = int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down"))-int(Input.is_action_pressed("ui_up"))

	if casting:
		direction.x = 0
		direction.y = 0
	elif direction.x == 0 and direction.y == 0:
		$charanim.current_animation = "Idle_S"
		
	elif direction.x == 1 and direction.y == 0:
		$charanim.current_animation = "Walk_E"
		
	elif direction.x == -1 and direction.y == 0:
		$charanim.current_animation = "Walk_W"
		
	elif direction.x == 0 and direction.y == 1:
		$charanim.current_animation = "Walk_S"
		
	elif direction.x == 0 and direction.y == -1:
		$charanim.current_animation = "Walk_N"
		
	elif direction.x == -1 and direction.y == -1:
		$charanim.current_animation = "Walk_NW"

	elif direction.x == 1 and direction.y == -1:
		$charanim.current_animation = "Walk_NE"

	elif direction.x == -1 and direction.y == 1:
		$charanim.current_animation = "Walk_SW"

	elif direction.x == 1 and direction.y == 1:
		$charanim.current_animation = "Walk_SE"
	direction.x *= 100
	direction.y *=70
	move_and_slide(direction)