extends Node2D

const GRAVITY = Vector2(0,1.5)
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#Reset score on level start
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Game.reset_score()
	pass

func _process(delta):
	$ScoreLabel.text = "Score: " + str(Game.get_score())

func _physics_process(delta):
	$Ship.velocity += GRAVITY
