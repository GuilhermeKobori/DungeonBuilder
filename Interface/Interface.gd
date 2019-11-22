extends Control

signal create_monster(name, cost)

var valid_monsters = ["Zombie", "Skeleton"]

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in $Store/GridContainer.get_children():
		print(item.monster_name)
		item.get_node("Button").connect("pressed", self, "show_infos_menu", [item.monster_name, item.monster_text])
		item.get_node("Buy").connect("button_down", self, "buy_monster", [item.monster_name, item.monster_cost])
	$Popup/MonsterInfos/Infos/Close.connect("pressed", self, "close_popup")

func show_infos_menu(monster_name, monster_text):
	$Popup/MonsterInfos.set_texts(monster_name, monster_text)
	$Popup/MonsterInfos/Infos/HBoxContainer/Stats.text = monster_text
	$Popup/MonsterInfos/Infos/HBoxContainer/VBoxContainer/Name.text = monster_name
	$Popup.popup()
	get_tree().paused = true
	
func buy_monster(monster_name, monster_cost):
	if monster_cost > get_parent().cash:
		return
		
	emit_signal("create_monster", monster_name, monster_cost)
	
func close_popup():
	$Popup.hide()
	get_tree().paused = false
