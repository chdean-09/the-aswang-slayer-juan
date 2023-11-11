extends Node2D

var Enemy = preload("res://enemy/enemy.tscn")
@onready var tilemap = $TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	print(tilemap.get_used_cells_by_id(1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_player_update_stats():
	$UI.update_holy_meter()

func _on_timer_timeout():
	var enemy = Enemy.instantiate()
	enemy.position = Vector2(Globals.player_position) + Vector2(randf_range(-100,100),randf_range(-100,100))
	add_child(enemy)
