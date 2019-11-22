extends TextureButton

var path = "res://Assets/"
var num = 0
signal lvl_button_pressed() 

func _ready():
	connect("pressed", self, "emmit")
	pass # Replace with function body.

func lvl_num(lvl):
	num = lvl
	var img = path + "Level" + str(lvl) + "Button.png"
	print(img)
	self.texture_normal = load(img)
	
func emmit():
	emit_signal("lvl_button_pressed")
