extends Node

var blocks_in_danger = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if blocks_in_danger >= 7 and $Timer.is_stopped():
		$Timer.start()
		print("count down started")
	
	$Label.text = "Blocks in danger: " + str(blocks_in_danger)


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
		# Restart game.
		print("restart")
	else:
		$Timer.stop()

	pass # replace with function body
