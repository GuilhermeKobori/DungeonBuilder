extends NinePatchRect

var item_menu = load("res://Interface/Monsters Menu/item_menu.tscn")
var monsters = ["res://Monsters/Zumbi.tres", "res://Monsters/Skeleton.tres"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	for monster in monsters:
		var item = item_menu.instance()
		item.init(monster)
		$GridContainer.add_child(item)

	pass # Replace with function body.


	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
