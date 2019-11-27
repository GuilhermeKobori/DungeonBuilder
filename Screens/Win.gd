extends Control

var path = "res://Screens/"

func _ready():
	$Menu/Buttons/MainMenu.connect("pressed", self, "on_mainmenu_button_pressed")
	$Menu/Buttons/MainMenu.connect("NextLevel", self, "on_next_button_pressed")
	get_node("AudioStreamPlayer").play()

	# if last level
	if global.current_level == global.num_of_level:
		$Menu/Buttons/NextLevel.hide()

	

func on_mainmenu_button_pressed():
	get_node("ButtonSound").play()

	#lines below pause the execution to allow clicking-sound to finisih before switching to next scene

	var t = get_node("Timer")
	t.start()
	yield(t, "timeout")
	t.queue_free()

	global.current_level = 0
	get_tree().change_scene("res://Screens/TitleScreen.tscn")

func _on_NextLevel_pressed():
	get_node("ButtonSound").play()

	#lines below pause the execution to allow clicking-sound to finisih before switching to next scene

	var t = get_node("Timer")
	t.start()
	yield(t, "timeout")
	t.queue_free()
	
	# if last unlocked level
	if global.last_unlocked_level == global.current_level:
		global.last_unlocked_level += 1

	global.current_level +=1
	var lvl = path + "Level" + str(global.current_level ) + ".tscn"
	get_tree().change_scene(lvl)

