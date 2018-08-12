extends Node

var blocks_in_danger = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$WarningLabel.hide()
	pass

func _process(delta):
	if blocks_in_danger >= 7 and $Timer.is_stopped():
		$Timer.start()
		$WarningLabel.show()
		print("count down started")


func _on_Area2D_body_entered(body):
	if body.has_method("ouch"):
		blocks_in_danger += 1
	pass # replace with function body


func _on_Area2D_body_exited(body):
	if body.has_method("ouch"):
		blocks_in_danger -= 1
	pass # replace with function body


func _on_Timer_timeout():
	if blocks_in_danger >= 7:
		get_tree().change_scene("res://Scenes/Menu.tscn")
	else:
		$WarningLabel.hide()
		$Timer.stop()

	pass # replace with function body
