extends KinematicBody2D

#constants
const BASE_HEALTH = 600
const DEFAULT_SPEED = 4000

#variables
var speedx
var speedy
var directionx
var directiony
var velocity = Vector2()
var sprite

func _ready():
	set_process(true)
	sprite = get_node("Sprite")
	pass
	
func _process(delta):
	
	# setting head direction
	if (directionx == 1):
		sprite.set_frame(2)
	elif (directionx == -1):
		sprite.set_frame(2)
	elif (directiony == -1):
		sprite.set_frame(0)
	elif (directiony == 1):
		sprite.set_frame(1)
	pass
	
func ground_pound():
	
