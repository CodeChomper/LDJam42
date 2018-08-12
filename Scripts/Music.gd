extends AudioStreamPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var music01 = "res://Sounds/Music01.ogg"
var music02 = "res://Sounds/Music02.ogg"
var music03 = "res://Sounds/Music03.ogg"
var parts = [music01, music02, music03]

func _ready():
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Music_finished():
	var part = parts[floor(rand_range(0,3))]
	var sfx = load(part) 
	sfx.set_loop(false)
	self.stream = sfx
	self.play()
	pass # replace with function body
