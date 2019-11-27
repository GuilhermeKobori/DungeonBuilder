extends Control

func _ready():
	$Menu/Buttons/Play.connect("pressed", self, "on_play_button_pressed")

	get_node("AudioStreamPlayer").play()

func on_play_button_pressed():
	get_node("AudioStreamPlayer2").play()

	#lines below pause the execution to allow clicking-sound to finisih before switching to next scene

	var t = get_node("Timer")
	t.start()
	yield(t, "timeout")
	t.queue_free()

	get_tree().change_scene("res://Screens/LevelSelect.tscn")