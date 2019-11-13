extends Control

func _ready():
	$Menu/Buttons/Retry.connect("pressed", self, "on_retry_button_pressed")
	$Menu/Buttons/MainMenu.connect("pressed", self, "on_mainmenu_button_pressed")

func on_mainmenu_button_pressed():
	global.current_level = 0
	get_tree().change_scene("res://TitleScreen.tscn")
	
func on_retry_button_pressed():
	if global.current_level == 1:
			get_tree().change_scene("res://Screens/Level1.tscn")
	# TODO fase 2