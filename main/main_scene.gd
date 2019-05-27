extends Node2D

var game_running = false 

func _ready():
	set_process(true)
	
func _process(delta):
	if game_running == false:
		if Input.is_action_pressed("ui_accept"):
			game_running = true
			get_node("label_info").set_text("Running")
	else:
		if Input.is_action_pressed("ui_cancel"):
			game_running = false
			get_node("label_info").set_text("Game over")
	
