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
	self.request(tmp_url,["user-agent: Godot"],false,HTTPClient.METHOD_PUT,value)


# Function works on its own or as called from the read_value signal
func read_value(path):
	var tmp_url = database_url + "/" + path + ".json"
	self.request(tmp_url,["user-agent: Godot"],false,HTTPClient.METHOD_GET,"");

# Callback for all HTTPRequests Need to see about how to tell if it is from GET or POST
# and react accordingly.
func _on_HTTPRequest_completed(result, response_code, headers, body):
	# Need to store the value somewhere so it is readable later
	#var json = JSON.parse(body.get_string_from_utf8())
	var tmp = body.get_string_from_utf8()
	print(tmp)
	var players_highscore = "Player One:0"
	var players = tmp.split('},')
	for j in range(players.size()):
		players[j] = players[j].replace("{", "")
		players[j] = players[j].replace('"', "")
		players[j] = players[j].replace(':', ",")
		var pArray = players[j].split(",")
		var pName = pArray[0]
		var pHighestScore = -1
		for i in range(2,pArray.size(),2):
			if int(pArray[i]) >= pHighestScore:
				pHighestScore = int(pArray[i])
		players_highscore += "," + pName + ":" + str(pHighestScore)

	print(players_highscore)
	
	
	var scores = players_highscore.split(',')
	var sorted_scores = [0]
	var sorted_names = [""]
	for score in scores:
		var s = score.split(':')
		var value = int(s[1])
		print(str(value))
		for i in range(sorted_scores.size()):
			if value > sorted_scores[i]:
				sorted_scores.insert(i,value)
				sorted_names.insert(i,s[0])
				break

	var output = ""
	for i in range(sorted_scores.size() - 1):
		output += sorted_names[i] + ": " + str(sorted_scores[i]) + "\n\n"

	$ScoresLabel.text = output
	
	pass