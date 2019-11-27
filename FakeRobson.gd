extends PathFollow2D

var path = "res://Heros/"

signal reached_end

signal killed_hero(hero)
var drop = 5

var sent = 1
#Stats
var speed : = 200.0
var hero_stats
var hero_speed = 200.0
var life = 30
var hero_name
var attack = 3
var atk_speed = 2


#TODO UPDATE SPRITE AND STATUS
func spawn(name):
	#Set Texture and Scale
	var iron_knight = preload("res://Heros/Knights/IronKnight/IronKnight.tscn").instance()
	add_child(iron_knight)

	#Set Status
	hero_stats = load(path + name + ".tres")
	drop = hero_stats.drop
	hero_speed = hero_stats.speed
	speed = hero_speed
	life = hero_stats.max_health
	attack = hero_stats.attack
	name = hero_stats.job_name
	atk_speed = hero_stats.atk_speed

	#TODO pass values to HeroBody
	$HeroBody.set_status(life, attack, atk_speed, speed)
	pass


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
	emit_signal("killed_hero", self)
	get_parent().remove_child(self)
