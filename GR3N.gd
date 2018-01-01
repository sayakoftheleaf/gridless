extends KinematicBody2D

#constants
const DEFAULT_SPEED = 3000
const BASE_HEALTH = 600

#variables
var speedx = 0
var speedy = 0
var directionx = 0
var directiony = 0
var velocity = Vector2()
var count = 0
var sprite
var walking_animations
var refresh = 0

func _ready():
	set_process(true)
	sprite = get_node("Sprite")
	walking_animations = get_node("Sprite/AnimationPlayer")
	walking_animations.set_animation_process_mode(0)
	pass
	
func return_refresh():
	var temp_refresh
	if(Input.is_action_pressed("ui_up") or
	   Input.is_action_pressed("ui_down") or
	   Input.is_action_pressed("ui_left") or
	   Input.is_action_pressed("ui_right")):
		temp_refresh = 0
	else:
		temp_refresh = 1
		
	return temp_refresh
	
func set_walking_animations(directionx, directiony, temp_refresh):
	
	if (directionx == 1 && walking_animations.get_current_animation() != "Rightmov"):
		walking_animations.play("Rightmov")
	elif (directionx == -1 && walking_animations.get_current_animation() != "Leftmov"):
		walking_animations.play("Leftmov")
	elif (directiony == 1 && walking_animations.get_current_animation() != "botmov" && directionx == 0):
		walking_animations.play("botmov")
	elif (directiony == -1 && walking_animations.get_current_animation() != "topmove" && directionx == 0):
		walking_animations.play("topmove")
	elif (directionx == 0 && directiony == 0):
		temp_refresh = 1
		
	return temp_refresh
	
func set_idle_frames(temp_refresh):
	if (temp_refresh == 1):
		if(walking_animations.get_current_animation() == "topmove"):
			sprite.set_frame(0)
		elif(walking_animations.get_current_animation() == "Rightmov"):
			sprite.set_frame(27)
		elif(walking_animations.get_current_animation() == "Leftmov"):
			sprite.set_frame(18)
		elif(walking_animations.get_current_animation() == "botmov"):
			sprite.set_frame(9)
		temp_refresh = 0
	
	return temp_refresh
	
func _process(delta):
	
	refresh = return_refresh()
		
	directiony = Input.is_action_pressed("ui_down") - Input.is_action_pressed("ui_up")
	directionx = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
		
	refresh = set_walking_animations(directionx, directiony, refresh)
	refresh = set_idle_frames(refresh)
		
	var unitvec = Vector2(directionx, directiony).normalized()
	velocity = unitvec * DEFAULT_SPEED * delta * delta
	move(velocity)
	
	pass
