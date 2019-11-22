extends KinematicBody2D

onready var healthy_bar = get_node("Bar")
signal hero_attack(id, damage)

var fighting = false

var life = 30
var attack = 4
var atk_speed = 2
var speed = 0.0

var hero = true

#Enemy stats
var monster
var monster_q : Array = [] #Enemies queue

var sent = 1

func _ready() -> void:
	set_process(true)
	healthy_bar.update_max_health(life)
	set_physics_process(true)

func set_status(l, a, a_s, s):
	print("Set : " + str(a))
	life = l
	attack = a
	atk_speed = a_s
	speed = s
	
func _process(delta: float) -> void:
	if life <= 0:
			print("Robson Dead")
			despawn()

func despawn() -> void:
			get_parent().despawn()

#Start Battle
func _on_Area2D_body_entered(body):
	if body.get('minion_placed'):
		get_parent().speed = 0.0
		#If already battling
		if monster != null:
			monster_q.append(body)
		else:
			monster = body
			monster.hero_atk(attack)
			$Timer.wait_time = atk_speed
			$Timer.start()
		fighting = true


#Suffered Attack
func minion_atk(damage):
	print("Minion atk " + str(damage))
	life -= damage
	healthy_bar.update_health(life, damage)

#Attack Timer
func _on_Timer_timeout():
	if fighting:
		monster.hero_atk(attack)

#End Battle
func _on_Area2D_body_exited(body):
	if body == monster:
		fighting = false
		$Timer.wait_time = 999999.9
		print("Matou")
		get_parent().speed = speed
		#If more heros to kill
		if monster_q.size() > 0:
			monster = monster_q[0]
			monster_q.remove(0)
			monster.minion_atk(attack)
			$Timer.wait_time = atk_speed
			$Timer.start()
		else:
			monster = null
