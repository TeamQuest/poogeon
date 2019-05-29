extends Node2D

var poop = preload("res://main/poop_scene.tscn")

var create_poop = false

func _ready():
	set_process(true)
	
func _process(delta):
	if globals.game_running == false:
		if Input.is_action_pressed("ui_accept"):
			globals.game_running = true
			get_node("background_scene/ParallaxBackground/ParallaxLayer/background_sprite").visible = true
			get_node("pigeon_scene/pigeon").visible = true
			get_node("menu_scene").visible = false
			
	else:
		if Input.is_action_pressed("ui_cancel"):
			globals.game_running = false
			get_node("background_scene/ParallaxBackground/ParallaxLayer/background_sprite").visible = false
			get_node("pigeon_scene/pigeon").visible = false
			get_node("game_over_scene").visible = true
	
	
		
func _on_Timer_timeout():
	if globals.game_running == true:
		var new_poop = poop.instance()
		add_child(new_poop)
		new_poop.set_owner(self)
	