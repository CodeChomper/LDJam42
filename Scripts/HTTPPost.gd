extends HTTPRequest

signal read_value(path)
export var database_url = ""
var scores = []

func _ready():
	# Signal fired when the request returns from the server
	connect("request_completed", self, "_on_HTTPRequest_completed")

	# Signal can be fired from Firebase node instead of calling the method
	connect("read_value", self, "read_value")

	pass

func post_value(path, value):
	var tmp_url = database_url + "/scores/" + path + ".json"
	self.request(tmp_url,["user-agent: Godot"],false,HTTPClient.METHOD_POST,value)


# Callback for all HTTPRequests Need to see about how to tell if it is from GET or POST
# and react accordingly.
func _on_HTTPRequest_completed(result, response_code, headers, body):
	print("score saved")
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass