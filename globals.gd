extends Node

signal health_change

var health = 100:
	get:
		return health
	set(value):
		if value > health:
			health = min(value, 100)
		else:
			health = value
		health_change.emit()

func dealDamage(damage):
	if damage > health:
		health = 0
	else:
		health -= damage

var player_position: Vector2
