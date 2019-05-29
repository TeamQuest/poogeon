extends KinematicBody2D

var speed = Vector2(0, 400)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(rand_range(50,1080), -50))

func _physics_process(delta):
	if globals.game_running == false and get_position().y > 1920:
		get_node(".").queue_free()
	else: 
		move_and_collide(speed * delta)