extends StaticBody2D

var can_drag = false

func _ready():
	$AnimationPlayer.play("Groovin'")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_drag = event.pressed

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_drag:
		#Use something like this to duplicate
		#load(X).instance()
		position = get_global_mouse_position()