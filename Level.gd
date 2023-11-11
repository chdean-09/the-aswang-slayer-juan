extends Node2D

var Enemy = preload("res://enemy/enemy.tscn")
@onready var tilemap = $TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# original world coordinate, your value
	var pos = Globals.player_position
	# map coordinate
	var cell_pos = tilemap.map_to_local(pos)
	# the Tile ID associated with that cell
	var cell_tile_id = tilemap.get_cell_source_id(0, cell_pos)
	# the name of the Tile stored within the TileMap's TileSet resource
#	var tile_name = tilemap.tileset.tile_get_name(cell_tile_id)
#	print(cell_pos, "pos")
#	print(cell_tile_id, "id")

func _on_player_update_stats():
	$UI.update_holy_meter()

func _on_timer_timeout():
	var enemy = Enemy.instantiate()
	
	enemy.position = Vector2(Globals.player_position) + Vector2(randf_range(-100, 100),randf_range(-100, 100))
	
	var cell_pos = tilemap.map_to_local(enemy.position)

	var cell_tile_id = tilemap.get_cell_source_id(0, cell_pos)
	
	print(cell_pos, cell_tile_id)
	if cell_tile_id == -1: 
		add_child(enemy)
	else: 
		print("collision")
