extends Area2D

func _on_body_entered(body):
	body.add_item()
	Globals.health -= 50
	queue_free()
