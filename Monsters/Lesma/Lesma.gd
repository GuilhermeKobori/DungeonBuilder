extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var monster_name = 'Lesma'
var life = 20
var attack = 2
var speed = 1
var sent = 1
onready var healthy_bar = get_node("Bar")


# Called when the node enters the scene tree for the first time.
func _ready():
	healthy_bar.update_max_health(life)
	set_physics_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta * sent * speed
	if sent == 1 and new_offset >= 0.99:
		sent = -1
		get_parent().set_unit_offset(0.99)
		get_node("Sprite").set_flip_h(false)
	elif sent == -1 and new_offset <= 0:
		sent = 1
		get_parent().set_unit_offset(0)
		get_node("Sprite").set_flip_h(true)
	else:
		get_parent().set_unit_offset(new_offset)


func _on_Area2D_body_entered(body):
	var other_attack = body.get('attack')
	if other_attack != null:
		life -= other_attack
		healthy_bar.update_health(life, other_attack)
	if life <= 0:
		var loaded = load("res://Assets/Inimigos/slimeDead.png")

		get_node("anim").stop()
		get_node("Sprite").set_texture(loaded)
		get_node("Sprite").set_offset(Vector2(0, 8))
		get_node("Area2D").queue_free()
		set_physics_process(false)
		yield(get_tree().create_timer(1.0), "timeout")
		get_parent().queue_free()

func monster_atk(id, damage):
	print("ROSON ATTK ID " + str(id))
