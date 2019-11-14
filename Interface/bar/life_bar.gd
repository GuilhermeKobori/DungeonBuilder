extends Control

onready var healthy_bar = $TextureProgress;
onready var update_tween = $UpdateTween;

export (Color) var healthy_color = Color.green
export (Color) var caution_color = Color.yellow
export (Color) var danger_color = Color.red
export (float, 0, 1, 0.05) var caution_zone = 0.5
export (float, 0, 1, 0.05) var danger_zone = 0.2


func update_health(health, amount):
	# healthy_bar.value = health - amount
	update_tween.interpolate_property(healthy_bar, "value", healthy_bar.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN)
	update_tween.start()
	_assign_color(health)
	
func update_max_health(max_health):
	healthy_bar.max_value = max_health;
	
func _assign_color(health):
	if health < healthy_bar.max_value * danger_zone:
		healthy_bar.tint_progress = danger_color
	elif health < healthy_bar.max_value * caution_zone:
		healthy_bar.tint_progress = caution_color
	else:
		healthy_bar.tint_progress = healthy_color