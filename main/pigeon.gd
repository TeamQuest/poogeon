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

func _physics_process(delta):
	if globals.game_running:
		if (Input.is_action_pressed("ui_left")):
			if kin_speed.x > -max_speed:
				kin_speed = kin_speed+ Vector2(-acc,0)
		elif (Input.is_action_pressed("ui_right")):
			if kin_speed.x < max_speed:
				kin_speed = kin_speed+ Vector2(acc,0)
		elif (Input.is_action_pressed("ui_up")):
			if kin_speed.y > -max_speed:
				kin_speed = kin_speed+ Vector2(0,-acc)
		elif (Input.is_action_pressed("ui_down")):
			if kin_speed.y < max_speed:
				kin_speed = kin_speed+ Vector2(0,acc)
		else:
			kin_speed.x = lerp(kin_speed.x, 0 , .03)
			kin_speed.y = lerp(kin_speed.y, 0 , .03)	
		var collision = move_and_collide(kin_speed * delta)
		
		if collision:
			var collider = collision.get_collider() as KinematicBody2D
			
			if collider.name == "poop":
				globals.pigeon_life -= 1
			if collider.name == "bread":
				globals.score += 100
				
			collider.queue_free()
			
#		if(get_position().x < pigeon_x):
#			kin_speed.x = 0
##			move_and_slide(Vector2(pigeon_x, get_position().y))
#		if(get_position().x > projectResolution.x - pigeon_x):
#			kin_speed.x = 0
##			move_and_slide(Vector2(projectResolution.x - pigeon_x, get_position().y))
#		if(get_position().y < pigeon_y):
#			kin_speed.y = 0
##			move_and_slide(Vector2(get_position().x, pigeon_y))
#		if(get_position().y > projectResolution.y - pigeon_y):
#			kin_speed.y = 0
##			move_and_slide(Vector2(get_position().x, projectResolution.y - pigeon_y))
	
	else:
		pass