extends KinematicBody2D

var life = 100
var attack = 2
var speed = 0.3

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	var other_attack = body.get('attack')
	if other_attack != null:
		life -= other_attack
		
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	print('Entrou uma area')
	pass # Replace with function body.
