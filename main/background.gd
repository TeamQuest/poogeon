extends ParallaxBackground
	
var offset_loc =0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func _process(delta):
	if globals.game_running == true:
		offset_loc = offset_loc + 150 * delta
		set_scroll_offset(Vector2(0, offset_loc))
