extends Area2D

var velocity = Vector2()
var SPEED = 300

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	self.position += velocity * SPEED * delta
	if self.position.y <= 10:
		self.queue_free()


func _on_Bullet_area_entered(area):
	self.queue_free()
	pass # replace with function body


func _on_Bullet_body_entered(body):
	if body.has_method("ouch"):
		body.ouch(10)
	self.queue_free()
	pass # replace with function body
