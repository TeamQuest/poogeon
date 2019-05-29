extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	get_node("final_score_label").set_text("YOUR SCORE: " + str(globals.score) )
