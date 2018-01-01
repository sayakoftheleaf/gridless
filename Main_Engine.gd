extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player
var heavies = []
var melees = []
var total_dmg


func _ready():
	player = get_node("GR3N")
	#temp
	heavies.append(get_node("Heavy"))
	set_process(true)
	pass

func _process(delta):
	
	total_dmg = 0
	
	for x in heavies:
		total_dmg = x.ground_pound(player)
	
	player.modify_health(total_dmg)
	print (player.current_health())
	pass
	
