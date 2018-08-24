extends KinematicBody2D

export var Up = Vector2(0,-1)
export var Gravity = 10
export var Jump = 10
export var Speed = 10

var motion = vector2()

func _ready():
	pass
	
func _physics_process(delta):
	
	motion.y -= Gravity
	
	if Input.is_action_pressed("ui_up"):
		motion.y =Jump
	if Input.is_action_pressed("ui_left"):
		motion.x -= Speed
	if Input.is_action_pressed("ui_right"):
		motion.x += Speed
		
	move_and_slide(motion,Up)
