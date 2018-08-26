extends KinematicBody2D

export var Up = Vector2(0,-1)
export var Gravity = 50
export var Jump = 100 setget set_Jump, get_Jump
export var JumpMax = 2
export var Speed = 500
export var Accel = 20
export var Health = 3

var motion = Vector2()
var jumpcount = 1


func set_Jump(jump):
	Jump = jump*10
func get_Jump():
	return Jump
	
func _ready():
	pass
	
func _physics_process(delta):
	
	motion.y += Gravity
	
	if Input.is_action_just_pressed("ui_up") and jumpcount < JumpMax:
		#print(jumpcount)
		jumpcount+=1
		motion.y = -Jump
	#print(jumpcount)
	
	if Input.is_action_pressed("ui_left"):
		motion.x = min(motion.x-Accel, -Speed)
	elif Input.is_action_pressed("ui_right"):
		motion.x = max(motion.x+Accel, Speed)
	else:
		motion.x = lerp(motion.x, 0, 0.15)
	if is_on_floor():
		jumpcount = 1
	
	motion = move_and_slide(motion,Up)
