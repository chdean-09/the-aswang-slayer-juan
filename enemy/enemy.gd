extends CharacterBody2D
 
const speed = 35

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var sprite := $Sprite2D as Sprite2D

func _process(_delta):
	sprite.look_at(player.global_position)

func _physics_process(_delta: float) -> void:
	if nav_agent.distance_to_target() > 15:
		var direction = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = direction * speed
		move_and_slide()

func makepath() -> void:
	nav_agent.target_position = player.global_position
	print(nav_agent.distance_to_target())

func _on_timer_timeout():
	makepath()
