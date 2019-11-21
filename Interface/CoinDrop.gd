extends Control

var vel : = 30
var initial_pos
var is_fading : = false
onready var tween = $Tween

func _ready():
	set_process(true)
	initial_pos = get_global_transform().origin

func _process(delta):
	var cur_pos = get_global_transform().origin
	if initial_pos.y - cur_pos.y > 20 and not is_fading:
		fade_out()

	if initial_pos.y - cur_pos.y > 100:
		get_parent().remove_child(self)
	
	set_position(cur_pos - Vector2(0, delta * vel))
	
func fade_out():
	is_fading = true

	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	tween.interpolate_property(self, "modulate", start_color, end_color, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()


