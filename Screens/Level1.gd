extends Node

var robson_factory = preload("res://FakeRobson.tscn")
var time_elapsed = 0.0

var robson_spawn_times = [0.5, 3.0, 5.0, 7.0, 10.0]
onready var path : Path2D = $Path2D


func _ready() -> void:
	set_physics_process(true)
	
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