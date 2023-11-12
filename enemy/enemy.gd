extends CharacterBody2D
 
const speed = 35
var health = 50
var spear_damage = 25

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var sprite := $Sprite2D as Sprite2D

func _process(_delta):
	sprite.look_at(Globals.player_position)

func _physics_process(_delta: float) -> void:
	if nav_agent.distance_to_target() > 17:
		var direction = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = direction * speed 
		$AnimationPlayer.play("idle")
		move_and_slide()
	else:
		attack()

func attack():
	$AnimationPlayer.play("attack")
	$AttackTimer.start()
	if is_inside_tree() and has_node("Sprite2D/Marker2D/EnemyAttack"):
		var bodies = get_node("Sprite2D/Marker2D/EnemyAttack").get_overlapping_bodies()
		for body in bodies:
			if body.has_method("take_damage"):
				body.take_damage(spear_damage)

func take_damage(amount):
	# Reduce enemy health when hit by the player's spear attack
	health -= amount
	print("Enemy health is", health)
	if health <= 0:
		die()

func die():
	queue_free()

func makepath() -> void:
	nav_agent.target_position = Globals.player_position

func _on_timer_timeout():
	makepath()

func _on_attack_timer_timeout():
	$AnimationPlayer.play("idle")
