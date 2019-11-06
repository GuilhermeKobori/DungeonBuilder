extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var sent = 1
var attack = 3;
var life = 10;
var defense = 2;

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta * sent * 0.3
	if sent == 1 and new_offset >= 0.99:
		sent = -1
		get_parent().set_unit_offset(0.99)
		get_node("Sprite").set_flip_h(false)
	elif sent == -1 and new_offset <= 0:
		sent = 1
		get_parent().set_unit_offset(0)
		get_node("Sprite").set_flip_h(true)
	else:
		get_parent().set_unit_offset(new_offset)
	