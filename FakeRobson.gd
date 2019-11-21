extends PathFollow2D

var MAX_SPEED = 200.0
var speed : = 400.0
signal reached_end
signal killed_hero(drop)
var drop = 5

var sent = 1
func _ready() -> void:
	set_process(true)
	set_physics_process(true)


func _process(delta: float) -> void:
	var move_distance : = speed * delta
	set_offset(get_offset() + move_distance)

	if unit_offset > 1.0:
		emit_signal("reached_end")
		despawn()
		
		



func despawn() -> void:
	emit_signal("killed_hero", drop)
	get_parent().remove_child(self)
