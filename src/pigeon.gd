extends KinematicBody2D

var y_velo = 0
const MOVE_SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_dir = Vector2(0.0, 0.0)
	if Input.is_action_pressed("ui_right"):
		move_dir.x += 1.0
	if Input.is_action_pressed("ui_left"):
		move_dir.x -= 1.0
	
	if Input.is_action_pressed("ui_up"):
		move_dir.y -= 1.0
	if Input.is_action_pressed("ui_down"):
		move_dir.y += 1.0
		
		
	move_and_slide(Vector2(move_dir.x * MOVE_SPEED, move_dir.y * MOVE_SPEED), Vector2(0, -1))