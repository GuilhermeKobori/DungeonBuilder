extends Node

signal cash_updated(cash)

var robson_factory = preload("res://FakeRobson.tscn")
var time_elapsed = 0.0

var greenSlimeScn = load("res://Monsters/GreenSlime/GreenSlime.tscn")
var minionScn = load("res://Monsters/Minion.tscn")

var cash : = 0

var robson_spawn_times = [5.0, 10.0]
onready var path : Path2D = $Path2D


func _ready() -> void:
	set_physics_process(true)
	$Interface.connect("create_monster", self, "bought_monster")
	
	connect("cash_updated", $Interface/CoinsCounter, "on_cash_updated")
	connect("cash_updated", $Interface/Store, "on_cash_updated")
	update_cash(5)

func bought_monster(name, cost):
	print("Bought Monster: " + name + " - Cost $" + str(cost))
	var monster = minionScn.instance()
	#var monster = greenSlimeScn.instance()
	monster.spawn(name)
	monster.minion_name = name
	add_child(monster)
	monster.dragging = true
	monster.connect("placed_monster", self, "on_monster_placed")
	
func _physics_process(delta: float) -> void:
	time_elapsed += delta
	if robson_spawn_times.size() > 0 and time_elapsed > robson_spawn_times[0]:
		robson_spawn_times.remove(0)
		spawn_robson()
		
	# verificar condiçao de vitoria
	if robson_spawn_times.size() == 0 and path.get_child_count() == 0:
		set_physics_process(false)
		get_tree().change_scene("res://Screens/Win.tscn")

func _on_end_reached() -> void:
	set_physics_process(false)
	get_tree().change_scene("res://Screens/GameOver.tscn")
	
func spawn_robson() -> void:
	var robson = robson_factory.instance()
	path.add_child(robson)
	robson.connect("reached_end", self, "_on_end_reached")
	
func on_monster_placed(name, cash):
	update_cash(-1 * cash)
	
func update_cash(delta) -> void:
	cash += delta
	emit_signal("cash_updated", cash)