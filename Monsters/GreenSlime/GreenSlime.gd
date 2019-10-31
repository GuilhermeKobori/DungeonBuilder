extends StaticBody2D

#defines dragability
var can_drag = false
#defines if the node can be deleted if it return to the menu
var has_been_touched = false
#valid tilesets indexes
var valid_tileset = [0, 2, 3]

func _ready():
	$AnimationPlayer.play("Groovin'")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_drag = event.pressed

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_drag:
		position = get_global_mouse_position()
		has_been_touched = true
	if has_been_touched and !Input.is_mouse_button_pressed(BUTTON_LEFT):
		#gets current tileset index, is used to verify if the slime
		#is in a valid position
		#Tilemaps use indexes based on the resolution in this case it
		#is 32x32 so we need to divide the position values to map them
		#to the corresponding positions of the tilemap
		print(self.position)
		var current_tile_index = get_node("../../Scene/TileMap").get_cell(self.position.x/32 + 1, self.position.y/32)
		#if the slime is dropped at the menu area we delete it
		if self.position.x < 167:
			get_parent().remove_child(self)
		#if the slime is not dropped in a tile we delete it
		elif current_tile_index == -1:
			get_parent().remove_child(self)
			print(current_tile_index)
		#if the slime is droped in an invalid tile we delete it
		elif !valid_tileset.has(current_tile_index):
			get_parent().remove_child(self)
			print(current_tile_index)