extends Node2D

var greenSlimeScn = load("res://Monsters/GreenSlime/GreenSlime.tscn")
var uniqueClick = true

func _ready():
	#start the groovin' animation
	$AnimationPlayer.play("Groovin'")
	#instantiates the first clone, this is done to have an
	#already instantiated node to move.
	#Otherwise we need to click first to create a new clone
	#and click once more to drag that clone and create the next
	#one to drag.
	##spaghetticode
	var greenSlime = greenSlimeScn.instance()
	add_child(greenSlime)

func _process(delta):
	#when the icon is clicked creates a new dragable clone
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and uniqueClick:
		var greenSlime = greenSlimeScn.instance()
		add_child(greenSlime)
		uniqueClick = false
	elif !Input.is_mouse_button_pressed(BUTTON_LEFT):
		uniqueClick = true
		