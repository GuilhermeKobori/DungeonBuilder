extends Node

signal cash_updated(cash)

var drop_factory = preload("res://Interface/CoinDrop.tscn")
var robson_factory = preload("res://FakeRobson.tscn")
var time_elapsed = 0.0

var greenSlimeScn = load("res://Monsters/GreenSlime/GreenSlime.tscn")
var minionScn = load("res://Monsters/Minion.tscn")

var cash : = 0
var cash_start = 15

var robson_spawn_times = [5.0, 10.0]

var dead_robsons = 0
var number_of_robsons = 10
onready var path : Path2D = $Path2D


func _ready() -> void:
	set_physics_process(true)
	$Interface.connect("create_monster", self, "bought_monster")
	#get_node("AudioStreamPlayer").play()

	connect("cash_updated", $Interface/CoinsCounter, "on_cash_updated")
	connect("cash_updated", $Interface/Store, "on_cash_updated")
	update_cash(15)

func bought_monster(name, cost):
	print("Bought Monster: " + name + " - Cost $" + str(cost))
	var monster = minionScn.instance()
	monster.spawn(name)
	add_child(monster)
	monster.dragging = true
	monster.connect("placed_monster", self, "on_monster_placed")


func _physics_process(delta: float) -> void:
	time_elapsed += delta
	if number_of_robsons > 0 and time_elapsed > generate_spawn_time():
		time_elapsed = 0
		number_of_robsons -= 1
		spawn_robson()

	# verificar condiçao de vitoria
	if number_of_robsons == 0 and path.get_child_count() == 0:
		set_physics_process(false)
		get_tree().change_scene("res://Screens/Win.tscn")

func _on_end_reached() -> void:
	set_physics_process(false)
	get_tree().change_scene("res://Screens/GameOver.tscn")

func spawn_robson() -> void:
	var robson = robson_factory.instance()
	#Spawn robson type
	robson.spawn("Robson")
	path.add_child(robson)
	robson.connect("reached_end", self, "_on_end_reached")

	robson.connect("killed_hero", self, "on_hero_killed")

func on_monster_placed(name, cash):
	update_cash(-1 * cash)

func on_hero_killed(hero):
	dead_robsons += 1
	update_cash(hero.drop)
	var drop = drop_factory.instance()
	drop.set_position(hero.position)
	drop.get_node("Coins").text = str(hero.drop)
	add_child(drop)


func update_cash(delta) -> void:
	cash += delta
	emit_signal("cash_updated", cash)


func generate_spawn_time():
	return rand_range(2.0, 10.0)