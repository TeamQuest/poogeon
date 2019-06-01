extends KinematicBody2D

const max_speed = 700
const acc = 20
var kin_speed = Vector2(0,0)

#var pigeon_x = get_node("./sprite_pigeon").get_texture().get_size().x
#var pigeon_y = get_node("pigeon/sprite_pigeon").get_texture().get_size().y
var pigeon_x = 100
var pigeon_y = 50

var poop = preload("res://main/poop_scene.tscn")
var bread = preload("res://main/bread_scene.tscn")

var projectResolution = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))

func _ready():
	set_process(true)

func _process(delta):
	
	var sprite = get_node("pigeon_sprite")
	var s = (1.7-global_position.y/2000.0)
	sprite.set_scale(Vector2(s, s))
	
	
func _physics_process(delta):
	if globals.game_running:
		if (Input.is_action_pressed("ui_left")):
			if(global_position.x < pigeon_x):
				kin_speed.x = 0 
			else :
				if kin_speed.x > -max_speed:
					kin_speed = kin_speed+ Vector2(-acc,0)
		elif (Input.is_action_pressed("ui_right")):
			if(global_position.x > projectResolution.x - pigeon_x):
				kin_speed.x = 0
			else:
				if kin_speed.x < max_speed:
					kin_speed = kin_speed+ Vector2(acc,0)
		elif (Input.is_action_pressed("ui_up")):
			if(global_position.y < pigeon_y):
				kin_speed.y = 0
			else:
				if kin_speed.y > -max_speed:
					kin_speed = kin_speed+ Vector2(0,-acc)
		elif (Input.is_action_pressed("ui_down")):
			if(global_position.y > projectResolution.y - pigeon_y):
				kin_speed.y = 0
			else :
				if kin_speed.y < max_speed:
					kin_speed = kin_speed+ Vector2(0,acc)
		else:
			kin_speed.x = lerp(kin_speed.x, 0 , .03)
			kin_speed.y = lerp(kin_speed.y, 0 , .03)	
		move_and_collide(kin_speed * delta)
			
	else:
		pass