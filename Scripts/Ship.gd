extends KinematicBody2D

var rot = 0
var velocity = Vector2()
var ROT_SPEED = 4
var THRUDT_POWER = 6
var bullet = load("res://Scenes/Bullet.tscn")
var can_shoot = true

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
	
	if Input.is_action_pressed("player_shoot") and can_shoot:
		if !$Shot.playing: $Shot.play()
		can_shoot = false
		var b = bullet.instance()
		b.velocity = Vector2(cos(self.rotation),sin(self.rotation))
		b.position = self.position
		get_parent().add_child(b)
		$ShotCoolDown.start()
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		$ShotCoolDown.wait_time = 0.5
		$ShotCoolDown.start()
		velocity = velocity.bounce(collision.normal) * 0.75
		if !$Bounce.playing:
			$Bounce.play()
	
	#velocity = move_and_slide(velocity, Vector2(0, -1))

func _on_ShotCoolDown_timeout():
	$ShotCoolDown.wait_time = 0.05
	can_shoot = true
	pass # replace with function body
