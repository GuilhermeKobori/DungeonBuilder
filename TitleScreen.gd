extends Control


func _ready():
	$Menu/Buttons/Level1.connect("pressed", self, "on_level1_button_pressed")
	$Menu/Buttons/Level2.connect("pressed", self, "on_level2_button_pressed")	

func on_level1_button_pressed():
	global.current_level = 1
	get_tree().change_scene("res://Screens/Level1.tscn")
	
	
func on_level2_button_pressed():
	global.current_level = 2
	# TODO