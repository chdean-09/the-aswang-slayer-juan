extends CanvasLayer

const BAR_SPEED = 1
var current_bar_value = 100

@onready var shortcuts_path = "Hotbar/TextureRect/HBoxContainer/"

var loaded_item = {"Slot": "Arnis", "Slot2": "Spear"}

# Called when the node enters the scene tree for the first time.
func _ready():
#	for shortcut in get_tree().get_nodes_in_group("Shortcuts"):
#	var something = get_tree().get_nodes_in_group("Shortcuts")[0].connect("pressed", SelectShortcut("Slot"))
	print(get_tree().get_nodes_in_group("Shortcuts")[1])
		
#	print(get_tree().get_nodes_in_group("Shortcuts"))
#	SelectShortcut("Slot")

func SelectShortcut(shortcut):
	get_parent().get_node("Player").selected_skill = loaded_item[shortcut]
	print(loaded_item[shortcut])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_bar_value -= BAR_SPEED * delta
	
	# Don't go below zero
	current_bar_value = max(current_bar_value, 0)
	
	$Control/Stats/HolyMeter.value = current_bar_value
	
func update_holy_meter():
	current_bar_value += 3
	
	# Don't go above max value
	current_bar_value = min(current_bar_value, 100)
	
	$Control/Stats/HolyMeter.value = current_bar_value
