extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$HighScoreDisplay.text = str(Game.get_high_score())
	$LineEdit.text = Game.player_name
	$LineEdit.grab_focus()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	Game.player_name = $LineEdit.text.to_upper()
	var p_name = Game.player_name.to_upper()
	if p_name == "": p_name = "PLAYER ONE"
	$HTTPRequest.post_value(p_name, str(Game.get_high_score()))
	pass # replace with function body
