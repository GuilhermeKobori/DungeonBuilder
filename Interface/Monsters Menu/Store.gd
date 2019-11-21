extends NinePatchRect

var item_menu = load("res://Interface/Monsters Menu/item_menu.tscn")
var path = "res://Monsters/"
var monsters = ["Zumbi", "Skeleton", "War Zombie", "Darkeleton"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	for monster in monsters:
		var item = item_menu.instance()
		var monster_path = path + monster + ".tres"
		item.init(monster_path)
		$GridContainer.add_child(item)

	pass # Replace with function body.


	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
