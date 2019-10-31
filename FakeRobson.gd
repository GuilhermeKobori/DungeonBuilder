extends PathFollow2D

var speed : = 400.0
signal reached_end

func _ready() -> void:
	set_process(true)


func _process(delta: float) -> void:
	var move_distance : = speed * delta
	set_offset(get_offset() + move_distance)

	if unit_offset > 1.0:
		emit_signal("reached_end")
		despawn()

# apenas para fins de teste, remover depois
func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
		
	despawn()
	
func despawn() -> void:
			get_parent().remove_child(self)