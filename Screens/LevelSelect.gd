extends Control

var button_scene = preload("res://Interface/StyledButton.tscn")

func _ready():
	for i in range(1, global.num_of_level + 1):
		var lvl_button = button_scene.instance()
		lvl_button.text = str(i)
		lvl_button.connect("pressed", self, "on_level_button_pressed", [i])
		
		if i > global.last_unlocked_level:
			lvl_button.disabled = true
		
		$Menu/Levels.add_child(lvl_button)

func on_level_button_pressed(num):
	#get_node("AudioStreamPlayer2").play()

	#lines below pause the execution to allow clicking-sound to finisih before switching to next scene
	#var t = get_node("Timer")
	#t.start()
	#yield(t, "timeout")
	#t.queue_free()

	global.current_level = num
	get_tree().change_scene("res://Screens/Level" + str(num) + ".tscn")