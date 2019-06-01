extends KinematicBody2D

var speed = Vector2(0, globals.poop_speed)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(rand_range(50,1080), -50))
	var sprite = get_node("poop_sprite")
	sprite.set_scale(sprite.get_scale() * 3)

func _process(delta):
	var sprite = get_node("poop_sprite")
	sprite.set_scale(sprite.get_scale() * 0.995)
	
func _physics_process(delta):
	if globals.game_running == false and get_position().y > 1920:
		get_node(".").queue_free()
	else: 
		speed.y += 7
		var collision = move_and_collide(speed * delta)
		
		if collision:
			var collider = collision.get_collider() as KinematicBody2D
			
			if collider.name == "pigeon":
				globals.pigeon_life -= 1
			elif collider.name == "bread":
				collider.queue_free()
			self.queue_free()