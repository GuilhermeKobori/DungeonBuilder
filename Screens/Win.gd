extends Control

func _ready():
	$Menu/Buttons/MainMenu.connect("pressed", self, "on_mainmenu_button_pressed")

func on_mainmenu_button_pressed():
	global.current_level = 0
	get_tree().change_scene("res://TitleScreen.tscn")