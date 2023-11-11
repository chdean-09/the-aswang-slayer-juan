extends CharacterBody2D

signal update_stats

@export var plr_speed =  0 
@onready var acceleration = 50
@onready var min_plr_speed = 40
@onready var max_plr_speed = 100 
@onready var spear_timer = $SpearAttackTimer
@onready var arnis_timer = $ArnisAttackTimer
@export var weapons = {"Arnis": "arnis", "Spear": "spear"}

@onready var current_weapon = weapons["Spear"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("bar_1"):
		current_weapon = weapons["Spear"]
		$AnimationPlayer.play("spear_idle")
	elif Input.is_action_just_pressed("bar_2"):
		current_weapon = weapons["Arnis"]
		$AnimationPlayer.play("arnis_idle")
	
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
		if current_weapon == weapons["Spear"] and spear_timer.is_stopped():
			print('spear atk')
			$AnimationPlayer.play("spear_attack")
			spear_timer.start()
			_on_spear_attack_timer_timeout()
		elif current_weapon == weapons["Arnis"] and arnis_timer.is_stopped():
			print('arnis atk')
			$AnimationPlayer.play("arnis_attack")
			arnis_timer.start()
			_on_arnis_attack_timer_timeout()

	if Input.is_action_pressed("rmb"):
		print(current_weapon)
		
		

func add_item() -> void:
	update_stats.emit()

func _on_spear_attack_timer_timeout():
	$AnimationPlayer.play('spear_idle')
	spear_timer.stop()

func _on_arnis_attack_timer_timeout():
	$AnimationPlayer.play('arnis_idle')
	arnis_timer.stop()
