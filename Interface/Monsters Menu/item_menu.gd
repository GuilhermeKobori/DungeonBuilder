extends Control

var monster_stats
var monster_name : String = ""
var monster_text : String = ""
var monster_cost : int

func init(stats):
	monster_stats = load(stats)

func _ready():
	monster_name = monster_stats.name
	monster_cost = monster_stats.cost
	$Name.text = monster_name
	$Cost.text = str(monster_cost)
	
	monster_text = "Custo: " + str(monster_stats.cost) + " $\n"
	monster_text += "Vida: " + str(monster_stats.max_health) + " \n"
	monster_text += "Velocidade: " + str(monster_stats.speed) + " \n"
	monster_text += "Tipo: " + str(monster_stats.type) + " \n"
	monster_text += "Alcance: " + str(monster_stats.reach) + " \n"
	monster_text += "Dano: " + str(monster_stats.attack) + " \n"
	monster_text += "Velocidade de Ataque: " + str(monster_stats.atk_speed)

	
	#start the groovin' animation

	#instantiates the first clone, this is done to have an
	#already instantiated node to move.
	#Otherwise we need to click first to create a new clone
	#and click once more to drag that clone and create the next
	#one to drag.
	##spaghetticode


	
func _process(delta):
	#when the icon is clicked creates a new dragable clone
	pass