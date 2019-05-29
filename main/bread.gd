extends RigidBody2D

var velocity = Vector2( 200.0, 0.0 )

var durability = 1
var points  = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(rand_range(50,1080), -50))
	rotation = rand_range(0, 360)

func _physics_process(delta):
	if globals.game_running == false and get_position().y > 1920:
		get_node(".").queue_free()
	else: 
		velocity = velocity.normalized() * 10
		
