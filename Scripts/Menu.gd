extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$CheckButton.pressed = Music.is_playing()
	$CheckButton.focus_mode = Control.FOCUS_NONE
	$HighScore.text = "High Score: " + str(Game.get_high_score())
	$CurrentScore.text = "Score: " + str(Game.get_score())
	$HTTPRequest.read_value("scores")
	pass

func _physics_process(delta):
	$Ship.velocity += Vector2(0,1.5)


func _on_CheckButton_pressed():
	if $CheckButton.pressed:
		Music.play()
	else:
		Music.stop()
	pass # replace with function body
