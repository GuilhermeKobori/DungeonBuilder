extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text = ""
var path = "res://Monsters/"
# Called when the node enters the scene tree for the first time.
func _ready():
	#$Infos/HBoxContainer/Label2.text = "OLAAAA"
	
	pass # Replace with function body.

func set_texts(monster_name, monster_text):
	$Infos/HBoxContainer/Stats.text = monster_text
	$Infos/HBoxContainer/VBoxContainer/Name.text = monster_name
	$Infos/HBoxContainer/VBoxContainer/Control/Icon.texture = load(path + monster_name + ".png") 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
