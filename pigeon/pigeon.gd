extends KinematicBody2D

var y_velo = 0
const max_speed = 700
const acc = 20
var kin_speed = Vector2(0,0)
var game_running = true

func _ready():
	set_process(true)
#	get_node(".").move(Vector2(540, 1450))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_running:
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
		move_and_slide(kin_speed, Vector2(0,-1))
		
		if(get_pos().x < shipPadX):
			kin_speed.x = 0
		
	else:
		pass