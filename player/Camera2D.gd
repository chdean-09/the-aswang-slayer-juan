extends Camera2D

var bobbing_shake: float = .25
var shake_fade: float = 20
var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0

func apply_bobbing_shake():
	shake_strength = bobbing_shake

func _process(delta):
	offset = Vector2(randf_range(-1, 1)*bobbing_shake, randf_range(-1, 1)*bobbing_shake)
	if Input.get_vector("move_left", "move_right", "move_up", "move_down") != Vector2.ZERO:
		apply_bobbing_shake()

	if shake_strength > 0:
		shake_strength = lerpf(shake_strength,0,shake_fade * delta/100)
		offset = randomOffset()

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength), rng.randf_range(-shake_strength,shake_strength)) 

