extends PathFollow2D

var path = "res://Heros/"

signal reached_end
signal killed_hero(drop)

var sent = 1
#Stats
var speed : = 200.0
var hero_stats
var hero_speed = 200.0
var drop = 5 
var life = 30
var hero_name
var attack = 3
var atk_speed = 2


#TODO UPDATE SPRITE AND STATUS
func spawn(name):
	#Set Texture and Scale
#	$Sprite.texture = load(path + name + ".png")
#	var y = $Sprite.texture.get_height()
#	$Sprite.scale.x = 40.0/y
#	$Sprite.scale.y = 40.0/y

	#Set Status
	#hero_stats = load(path + name + ".tres")
	#drop = drop
	#speed
	#attack
	#life
	#name
	#atk_speed
	
	$HeroBody.set_status(life, attack, atk_speed, speed)
	
	
func _ready() -> void:
	set_process(true)
	set_physics_process(true)

func _process(delta: float) -> void:
	var move_distance : = speed * delta
	set_offset(get_offset() + move_distance)

	if unit_offset > 1.0:
		emit_signal("reached_end")
		despawn()

func despawn() -> void:
	emit_signal("killed_hero", drop)
	get_parent().remove_child(self)
