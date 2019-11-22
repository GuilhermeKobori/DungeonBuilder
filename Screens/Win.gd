extends Control

var path = "res://Screens/"

func _ready():
	$Menu/Buttons/MainMenu.connect("pressed", self, "on_mainmenu_button_pressed")
	$Menu/Buttons/MainMenu.connect("NextLevel", self, "on_next_button_pressed")
	get_node("AudioStreamPlayer").play()
	
	# if last level
	if global.current_level == global.num_of_level:
		$Menu/Buttons/NextLevel.hide()
		
	# if last unlocked level
	if global.last_unlocked_level == global.current_level:
		global.last_unlocked_level += 1

func on_mainmenu_button_pressed():
	global.current_level = 0
	get_tree().change_scene("res://TitleScreen.tscn")
	
func _on_NextLevel_pressed():
	var lvl = path + "Level" + str(global.current_level + 1) + ".tscn"
	get_tree().change_scene(lvl)

