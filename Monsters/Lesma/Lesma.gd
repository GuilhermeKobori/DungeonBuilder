extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var monster_name = 'Lesma'
var life = 10
var attack = 2
var speed = 0.3
var sent = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	print(name)
	set_physics_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta * sent * speed
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
	