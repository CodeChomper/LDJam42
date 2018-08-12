extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var health = 100
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	
	if health <= 0:
		get_tree().change_scene("res://Scenes/Level.tscn")




func _on_Areay2D_area_entered(area):
	health -= 10
	pass # replace with function body


func _on_Areay2D_body_entered(body):
	health -= 10
	pass # replace with function body
