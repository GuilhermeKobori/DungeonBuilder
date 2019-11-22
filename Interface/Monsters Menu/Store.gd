extends NinePatchRect

var item_menu = load("res://Interface/Monsters Menu/item_menu.tscn")
var path = "res://Monsters/"
var monsters = ["Zombie", "Skeleton", "War Zombie", "Darkeleton"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	monsters = get_parent().get_parent().valid_monsters
	for monster in monsters:
		var item = item_menu.instance()
		var monster_path = path + monster + ".tres"
		item.init(monster_path)
		$GridContainer.add_child(item)

	pass # Replace with function body.

func on_cash_updated(cash):
	for item in $GridContainer.get_children():
		if item.monster_cost > cash:
			item.get_node("Name").set("custom_colors/font_color", "#555555")
			item.get_node("Button").set("custom_colors/font_color", "#555555")
			item.get_node("Cost").set("custom_colors/font_color", "#FF0000")
			item.enable_grayscale()	
		else:
			item.get_node("Name").set("custom_colors/font_color", "#634726")
			item.get_node("Button").set("custom_colors/font_color", "#886e4e")
			item.get_node("Cost").set("custom_colors/font_color", "#393210")
			item.disable_grayscale()				
