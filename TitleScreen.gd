extends Control



func _ready():
	$Menu/Buttons/Level1.connect("pressed", self, "on_level1_button_pressed")
	$Menu/Buttons/Level2.connect("pressed", self, "on_level2_button_pressed")

	get_node("AudioStreamPlayer").play()

func on_level1_button_pressed():
	get_node("AudioStreamPlayer2").play()

	#lines below pause the execution to allow clicking-sound to finisih before switching to next scene
	var t = get_node("Timer")
	t.start()
	yield(t, "timeout")
	t.queue_free()

	global.current_level = 1
	get_tree().change_scene("res://Screens/Level1.tscn")


func on_level2_button_pressed():
	get_node("AudioStreamPlayer2").play()

	#lines below pause the execution to allow clicking-sound to finisih before switching to next scene
	var t = get_node("Timer")
	t.start()
	yield(t, "timeout")
	t.queue_free()

	global.current_level = 2
	get_tree().change_scene("res://Screens/Level2.tscn")