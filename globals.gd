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
	health -= damage
