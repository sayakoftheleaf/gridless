extends StaticBody2D

# const
const BASE_DAMAGE = 300

#variables
var dmg_area

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	dmg_area = get_node("Area2D")
	pass
	
func return_damage():
	return BASE_DAMAGE
	
func _process(delta):
	
	pass
	
