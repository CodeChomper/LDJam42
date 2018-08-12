extends KinematicBody2D

var rot = 0
var velocity = Vector2()
var ROT_SPEED = 4
var THRUDT_POWER = 6


func _ready():
	pass

func _physics_process(delta):
	#Handle User Input
	if Input.is_action_pressed("player_left"):
		rot = -ROT_SPEED * delta
	elif Input.is_action_pressed("player_right"):
		rot = ROT_SPEED * delta
	else:
		rot *= 0.4
	self.rotate(rot)
	
	if Input.is_action_pressed("player_thrust"):
		var tmp = Vector2();
		tmp.x = cos(self.rotation)
		tmp.y = sin(self.rotation)
		velocity += tmp * THRUDT_POWER
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal) * 0.75
		
	#velocity = move_and_slide(velocity, Vector2(0, -1))