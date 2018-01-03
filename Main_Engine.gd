extends Node2D

var player
var heavies = []
var melees = []
var total_dmg
var path
var navnode

func _ready():
	player = get_node("GR3N")
	navnode = get_node("Navigation2D")
	#temp
	heavies.append(get_node("Heavy"))
	set_process(true)
	pass

func _process(delta):
	
	total_dmg = 0
	
	for x in heavies:
		#total_dmg = x.ground_pound(player)
#		path = navnode.get_simple_path(x.return_pos(), player.get_pos())
		print(path)
	
	player.modify_health(total_dmg)
	pass
	
