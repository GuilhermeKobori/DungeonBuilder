extends Control

var path = "res://Screens/"

func _ready():
	$Menu/Buttons/Retry.connect("pressed", self, "on_retry_button_pressed")
	$Menu/Buttons/MainMenu.connect("pressed", self, "on_mainmenu_button_pressed")

	get_node("AudioStreamPlayer").play()

func on_mainmenu_button_pressed():
	global.current_level = 0
	get_tree().change_scene("res://Screens/TitleScreen.tscn")

func on_retry_button_pressed():
	var lvl = path + "Level" + str(global.current_level) + ".tscn"
	get_tree().change_scene(lvl)