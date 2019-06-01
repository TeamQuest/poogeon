extends KinematicBody2D

var speed = Vector2(0, 300)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(rand_range(50,1080), -50))
	rotation = rand_range(0, 360)
	var sprite = get_node("bread_sprite")
	sprite.set_scale(sprite.get_scale() * 3)

func _process(delta):
	var sprite = get_node("bread_sprite")
	sprite.set_scale(sprite.get_scale() * 0.995)
	
func _physics_process(delta):
	if globals.game_running == false and get_position().y > 1920:
		get_node(".").queue_free()
	else: 
		var collision = move_and_collide(speed * delta)
		
		if collision:
			var collider = collision.get_collider() as KinematicBody2D
			
			if collider.name == "pigeon":
				globals.score += 100
				self.queue_free()