extends KinematicBody2D

var life = 100
var attack = 2
var speed = 0.3
onready var healthy_bar = get_node("Bar")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	healthy_bar.update_max_health(life)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	var other_attack = body.get('attack')
	if other_attack != null:
		life -= other_attack
		healthy_bar.update_health(life, other_attack)
		print(life)
		
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	print('Entrou uma area')
	pass # Replace with function body.
