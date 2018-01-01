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
	
	directionx = -1
	directiony = 0
	
	# setting head direction
	if (directionx == 1):
		sprite.set_frame(2)
	elif (directionx == -1):
		sprite.set_frame(2)
	elif (directiony == -1):
		sprite.set_frame(0)
	elif (directiony == 1):
		sprite.set_frame(1)
		
	velocity = Vector2(DEFAULT_SPEED * directionx, DEFAULT_SPEED * directiony)
	velocity = velocity * delta * delta
	move(velocity)
	pass
	
func ground_pound(playa):
	var attack = get_node("shoc/Area2D")
	var dmg = 0
	if (attack.overlaps_body(playa)):
		dmg = attack.return_dmg()
		
	return dmg
	
