extends CanvasLayer

const BAR_SPEED = 1
var current_bar_value = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_bar_value -= BAR_SPEED * delta
	
	# Don't go below zero
	current_bar_value = max(current_bar_value, 0)
	
	$HolyMeter/TextureProgressBar.value = current_bar_value
	
func update_holy_meter():
	current_bar_value += 3
	
	# Don't go above max value
	current_bar_value = min(current_bar_value, 100)
	
	$HolyMeter/TextureProgressBar.value = current_bar_value
