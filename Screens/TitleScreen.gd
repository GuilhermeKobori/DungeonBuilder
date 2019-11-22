extends Control

func _ready():
	$Menu/Buttons/Play.connect("pressed", self, "on_play_button_pressed")

	get_node("AudioStreamPlayer").play()

func on_play_button_pressed():
	get_tree().change_scene("res://Screens/LevelSelect.tscn")
