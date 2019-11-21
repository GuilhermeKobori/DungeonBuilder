extends StaticBody2D

#defines dragability
var can_drag = false
var dragging = false
#defines if the node can be deleted if it return to the menu
var has_been_touched = false
#valid tilesets indexes
var valid_tileset = [0, 2, 3, 9]
var tile_size = 28.8

func _init():
	pass
	
func _ready():
	#$AnimationPlayer.play("Groovin'")
	pass
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_drag = event.pressed

func _process(delta):
	print("oi")
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
		#if the slime is not dropped in a tile we delete it
		elif current_tile_index == -1:
			get_parent().remove_child(self)
		#if the slime is droped in an invalid tile we delete it
		elif !valid_tileset.has(current_tile_index):
			get_parent().remove_child(self)
			
		print("Position x: " + str(self.position.x) + "tile: " + str(current_tile_index))
		
#func _process(delta):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_drag:
#		position = get_global_mouse_position()
#		has_been_touched = true
#	if has_been_touched and !Input.is_mouse_button_pressed(BUTTON_LEFT):
#		#gets current tileset index, is used to verify if the slime
#		#is in a valid position
#		#Tilemaps use indexes based on the resolution in this case it
#		#is 32x32 so we need to divide the position values to map them
#		#to the corresponding positions of the tilemap
#		var current_tile_index = get_node("../../Scene/TileMap").get_cell(ceil(self.position.x/30), ceil(self.position.y/30 - 1))
#		#if the slime is dropped at the menu area we delete it
#		if self.position.x < 170:
#			get_parent().remove_child(self)
#		#if the slime is not dropped in a tile we delete it
#		elif current_tile_index == -1:
#			get_parent().remove_child(self)
#		#if the slime is droped in an invalid tile we delete it
#		elif !valid_tileset.has(current_tile_index):
#			get_parent().remove_child(self)
