extends RigidBody2D

var health = 100
var alive = true

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if position.y > 1100:
		self.queue_free()
	if health <= 0 and alive:
		alive = false
		Game.add_score(10)
		$AudioStreamPlayer.play()
		self.hide()
		self.remove_and_skip()

func ouch(hit_value):
	health -= hit_value;



func _on_AudioStreamPlayer_finished():
	self.queue_free()
	pass # replace with function body
