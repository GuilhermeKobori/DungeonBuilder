extends Node2D

var greenSlimeScn = load("res://Monsters/GreenSlime/GreenSlime.tscn")

func _ready():
	$AnimationPlayer.play("Groovin'")
	var greenSlime = greenSlimeScn.instance()
	add_child(greenSlime)

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		var greenSlime = greenSlimeScn.instance()
		add_child(greenSlime)