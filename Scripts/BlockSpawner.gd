extends Node2D

var block1 = load("res://Scenes/Block1.tscn")
var block2 = load("res://Scenes/Block2.tscn")
var block3 = load("res://Scenes/Block3.tscn")
var block4 = load("res://Scenes/Block4.tscn")
var block5 = load("res://Scenes/Block5.tscn")
var block6 = load("res://Scenes/Block6.tscn")
var block7 = load("res://Scenes/Block7.tscn")

var blocks = [block1,block2,block3,block4,block5,block6,block7]

var time_between_blocks = 3

func _ready():
	$SpawnTimer.wait_time = time_between_blocks;
	$SpawnTimer.start()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_SpawnTimer_timeout():
	print('spawning block')
	time_between_blocks -= 0.02
	$SpawnTimer.wait_time = time_between_blocks
	$SpawnTimer.start()
	
	var block_index = floor(rand_range(0,blocks.size()))
	
	var b = blocks[block_index].instance()
	b.position = Vector2(rand_range(32,880),-60)
	add_child(b)
	pass # replace with function body










