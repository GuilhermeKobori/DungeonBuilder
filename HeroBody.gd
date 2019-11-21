extends KinematicBody2D

var MAX_SPEED = 200.0

onready var healthy_bar = get_node("Bar")
var monster_name = 'Lesma'
var life = 30
var attack = 5
var atk_speed = 1

var hero = true

#Enemy stats
var fighting = false
var monster
var monster_attack
var monster_atk_speed

var sent = 1
func _ready() -> void:
	set_process(true)
	healthy_bar.update_max_health(life)
	set_physics_process(true)


func _process(delta: float) -> void:
	if life <= 0:
			print("Robson Dead")
			despawn()
#			var loaded = load("res://Assets/Inimigos/slimeDead.png")
#
#			get_node("anim").stop()
#			get_node("Sprite").set_texture(loaded)
#			get_node("Sprite").set_offset(Vector2(0, 8))
#			get_node("Area2D").queue_free()
#			set_physics_process(false)
#			yield(get_tree().create_timer(1.0), "timeout")
#			get_parent().queue_free()
#	if fighting:
#		monster_attack = monster.get('attack')
#		if monster_attack != null:
#			life -= monster_attack
#			healthy_bar.update_health(life, monster_attack)
	pass
		


func despawn() -> void:
			get_parent().despawn()

func _on_Area2D_body_entered(body):
	print("ENTROU 2")
	if body.get('minion_placed'):
		print("luta")
		get_parent().speed = 0.0
		monster = body
		fighting = true
		
		monster_attack = body.get('attack')
		if monster_attack != null:
			life -= monster_attack
			healthy_bar.update_health(life, monster_attack)
		monster_atk_speed = body.get('atk_speed')
		$Timer.wait_time = monster_atk_speed
		$Timer.start()
	pass # Replace with function body.


func _on_Timer_timeout():
	print("atking")
	if fighting:
		if monster_attack != null:
			life -= monster_attack
			healthy_bar.update_health(life, monster_attack)
			print(life)
	pass # Replace with function body.

	
func _on_Area2D_body_exited(body):
	if body == monster:
		fighting = false
		$Timer.wait_time = 999999.9
		print("Matou")
		get_parent().speed = MAX_SPEED
	pass # Replace with function body.
