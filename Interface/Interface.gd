extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in $Store/GridContainer.get_children():
		print(item.monster_name)
		item.get_node("Button").connect("pressed", self, "show_infos_menu", [item.monster_name, item.monster_text])
	$Popup/MonsterInfos/Infos/Close.connect("pressed", self, "close_popup")

func show_infos_menu(monster_name, monster_text):
	$Popup/MonsterInfos.set_texts(monster_name, monster_text)
	$Popup/MonsterInfos/Infos/HBoxContainer/Stats.text = monster_text
	$Popup/MonsterInfos/Infos/HBoxContainer/VBoxContainer/Name.text = monster_name
	$Popup.popup()
	
func close_popup():
	print("close")
	$Popup.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
