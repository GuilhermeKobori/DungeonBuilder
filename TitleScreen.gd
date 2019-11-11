extends Control


func _ready():
	$Menu/Buttons/Level1.connect("pressed", self, "on_level1_button_pressed")
	$Menu/Buttons/Level2.connect("pressed", self, "on_level2_button_pressed")	

func on_level1_button_pressed():
	get_tree().change_scene("res://Screens/Level1.tscn")
	
	
# TODO
func on_level2_button_pressed():
	pass