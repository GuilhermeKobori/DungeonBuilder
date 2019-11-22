extends KinematicBody2D

#defines dragability
var dragging = false
#defines if the node can be deleted if it return to the menu
var has_been_touched = false
#valid tilesets indexes
var valid_tileset = [0, 2, 3, 9]
var tile_size = 28.8

#signal when monster placed in valid tile
signal placed_monster(name, cost)
signal minion_attack(id, damage)

var minion_stats
var minion_name = "Zombie"
var path = "res://Monsters/"
var life = 100
var attack = 5
var cost = 0
var atk_speed = 2


var fighting = false
var minion_placed = false

#Enemy
var hero = null
var hero_q : Array = [] #Enemies queue


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
	life = minion_stats.max_health
	attack = minion_stats.attack
	atk_speed = minion_stats.atk_speed
	

	
func _ready():
	#$AnimationPlayer.play("Groovin'")
	healthy_bar.update_max_health(life)
	pass


	
func _input_event(viewport, event, shape_idx):
	print("input event")
	if event is InputEventMouseButton:
		dragging = event.pressed

func _process(delta):
	#Drag while button pressed
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and dragging:
        position = get_global_mouse_position()
	#When released verify valid position and place it
	if dragging and !Input.is_mouse_button_pressed(BUTTON_LEFT):
		dragging = false
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
		
		#Has been placed
		minion_placed = true
		emit_signal("placed_monster", minion_name, cost)
		
		
	#DEAD
	if life <= 0:
		print("Monster Dead")
		despawn()
			

func despawn() -> void:
	get_parent().remove_child(self)

#When Hero begin battle
func _on_Area2D_body_entered(body):
	print(" ENTROOOU " + str(body) + str(body.get('hero')))
	
	if body.get('hero') and minion_placed:
		print(body)
		fighting = true
		hero_q.append(body)
		#If already battling
		if hero != null:
			print("Append")
#			hero_q.append(body)
		else:
			hero = hero_q[0]
			hero_q.remove(0)
			hero.minion_atk(hero.attack)
			$Timer.wait_time = atk_speed
			$Timer.start()
	pass # Replace with function body.

#Suffered Attack
func hero_atk(damage):
	print("Hero atk " + str(damage))
	print(hero)
	life -= damage
	healthy_bar.update_health(life, damage)

#Atk timer
func _on_Timer_timeout():
	if fighting:
		hero.minion_atk(attack)

func _on_Area2D_body_exited(body):
	if body == hero:
		print("Matou")
		#If more heros to kill
		if hero_q.size() > 0:
			print("pop")
			hero = hero_q[0]
			hero_q.remove(0)
			hero.minion_atk(attack)
			$Timer.wait_time = atk_speed
			$Timer.start()
		else:
			$Timer.wait_time = 999999.9
			fighting = false
			hero = null