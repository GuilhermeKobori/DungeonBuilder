extends Control

var lvl_button_scn = preload("res://Level_button.tscn")

func _ready():
	for i in range(1, global.next_level+1):
		print(str(i))
		var lvl_button = lvl_button_scn.instance()
		$Menu/Buttons.add_child(lvl_button)
		lvl_button.lvl_num(i)
		lvl_button.connect("lvl_button_pressed", self, "on_level_button_pressed", [lvl_button.num])
		
	#$Menu/Buttons/Level1.connect("pressed", self, "on_level1_button_pressed")
	#$Menu/Buttons/Level2.connect("pressed", self, "on_level2_button_pressed")

	get_node("AudioStreamPlayer").play()

func on_level_button_pressed(num):
	get_node("AudioStreamPlayer2").play()

	#lines below pause the execution to allow clicking-sound to finisih before switching to next scene
	var t = get_node("Timer")
	t.start()
	yield(t, "timeout")
	t.queue_free()

	global.current_level = num
	get_tree().change_scene("res://Screens/Level" + str(num) + ".tscn")
