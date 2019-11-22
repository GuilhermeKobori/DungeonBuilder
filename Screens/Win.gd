extends Control

var path = "res://Screens/"

func _ready():
	$Menu/Buttons/MainMenu.connect("pressed", self, "on_mainmenu_button_pressed")
	get_node("AudioStreamPlayer").play()
	
	#If last lvl
	if(global.current_level == global.num_of_level):
		$Menu/Buttons/Next.hide()
	else:
		global.next_level = global.current_level+1

func on_mainmenu_button_pressed():
	global.current_level = 0
	get_tree().change_scene("res://TitleScreen.tscn")
	

func _on_Next_pressed():
	var lvl = path + "Level" + str(global.next_level) + ".tscn"
	print("lvl")
	get_tree().change_scene(lvl)
	pass # Replace with function body.
