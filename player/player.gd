extends CharacterBody2D

var acceleration = 350
var min_plr_speed = 600
var plr_speed =  0 
var max_plr_speed = 1200 # 2x of min speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction == Vector2.ZERO:
		plr_speed = min_plr_speed
	else:
		if plr_speed < max_plr_speed:
			plr_speed += acceleration*delta
		elif plr_speed > max_plr_speed:
			plr_speed = max_plr_speed
	velocity = direction*plr_speed
	move_and_slide()
	
	if Input.is_action_pressed("lmb"):
		print("left mouse button")
	if Input.is_action_pressed("rmb"):
		print("right mouse button")
