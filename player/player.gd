extends CharacterBody2D

signal update_stats

@export var plr_speed =  0 
var acceleration = 50
var min_plr_speed = 40
var max_plr_speed = 100 


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
	
	rotate(get_angle_to(get_global_mouse_position()))
	
	if Input.is_action_pressed("lmb"):
		$AnimationPlayer.play("arnis_attack")
		$SpearAttackTimer.start()
		
	if Input.is_action_pressed("rmb"):
		print("right mouse button")
		
		

func add_item() -> void:
	update_stats.emit()

func _on_spear_attack_timer_timeout():
	$AnimationPlayer.play('arnis_idle')
