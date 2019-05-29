extends Node2D

var poop = preload("res://main/poop_scene.tscn")
var bread = preload("res://main/bread_scene.tscn")

func _ready():
	set_process(true)
	
func _process(delta):
	if globals.game_running == false:
		if Input.is_action_pressed("ui_accept"):
			globals.game_running = true
			globals.score = 0
			
			get_node("background_scene/ParallaxBackground/ParallaxLayer/background_sprite").visible = true
			get_node("pigeon_scene/pigeon").visible = true
			get_node("background_scene").visible = true
			get_node("score_label").visible = true
			get_node("menu_scene").visible = false
			
	else:
		if Input.is_action_pressed("ui_cancel") or globals.pigeon_life == 0:
			globals.game_running = false
			get_node("background_scene/ParallaxBackground/ParallaxLayer/background_sprite").visible = false
			get_node("pigeon_scene/pigeon").visible = false
			get_node("game_over_scene").visible =true
		
func _on_Timer_timeout():        
	if globals.game_running == true:
		create_poop()
		create_bread()
		globals.score += 10
		get_node("score_label").set_text("SCORE: " + str(globals.score))
	
func create_poop():
	var new_poop = poop.instance()
	add_child(new_poop)     
	new_poop.set_owner(self)
	
func create_bread():
	var new_bread = bread.instance()
	add_child(new_bread)     
	new_bread.set_owner(self)