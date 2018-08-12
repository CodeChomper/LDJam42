tool
extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var colShape

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_col_shape()
	pass

func _process(delta):
	if Engine.is_editor_hint():
		set_col_shape()
	pass

func set_col_shape():
	if colShape == null:
		colShape = RectangleShape2D.new()
		$StaticBody2D/CollisionShape2D.shape = colShape
	
	$StaticBody2D/CollisionShape2D.shape = colShape
	colShape.set_extents(self.rect_size / 2)
	$StaticBody2D.position = self.rect_size / 2