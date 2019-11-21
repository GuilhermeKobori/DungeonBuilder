extends StaticBody2D

#defines dragability
var can_drag = false
var dragging = false
#defines if the node can be deleted if it return to the menu
var has_been_touched = false
#valid tilesets indexes
var valid_tileset = [0, 2, 3, 9]
var tile_size = 28.8

#signal when monster placed in valid tile
signal placed_monster(name, cost)

var minion_stats
var minion_name = "Zombie"
var path = "res://Monsters/"
var life = 100
var attack = 2
var speed = 0.3
var cost = 0
onready var healthy_bar = get_node("Bar")

func spawn(name):
	#Set Texture and Scale
	$Sprite.texture = load(path + name + ".png")
	var y = $Sprite.texture.get_height()
	$Sprite.scale.x = 40.0/y
	$Sprite.scale.y = 40.0/y
	#Set Status
	minion_stats = load(path + name + ".tres")
	cost = minion_stats.cost
	minion_name = minion_stats.name
	

	
func _ready():
	#$AnimationPlayer.play("Groovin'")
	pass


	
func _input_event(viewport, event, shape_idx):
	print("input event")
	if event is InputEventMouseButton:
		dragging = event.pressed

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and dragging:
        position = get_global_mouse_position()
	if dragging and !Input.is_mouse_button_pressed(BUTTON_LEFT):
		dragging = false
		print("x: " + str(self.position.x) + " y: " + str(self.position.y))
		print("x: " + str(floor(self.position.x/tile_size)) + " y: " + str(floor(self.position.y/tile_size)))
		#get_node("../../Scene/TileMap").map_to_world(Vector2(floor(self.position.x/tile_size), floor(self.position.y/tile_size))) 
		var current_tile_index = get_node("../../Scene/TileMap").get_cell(floor(self.position.x/28.8), floor(self.position.y/28.8))
		#if the slime is dropped at the menu area we delete it
		if self.position.x < 167:
			get_parent().remove_child(self)
			return
		#if the slime is not dropped in a tile we delete it
		elif current_tile_index == -1:
			get_parent().remove_child(self)
			return
		#if the slime is droped in an invalid tile we delete it
		elif !valid_tileset.has(current_tile_index):
			get_parent().remove_child(self)
			return
		
		emit_signal("placed_monster", minion_name, cost)
		print("Position x: " + str(self.position.x) + "tile: " + str(current_tile_index))
