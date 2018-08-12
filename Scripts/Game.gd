extends Node

var _score = 0
var _high_score = 0

var MusicPlayer

func add_score(points):
	_score += points
	if _score > _high_score:
		_high_score = _score

func get_score():
	return _score

func get_high_score():
	return _high_score

func reset_score():
	_score = 0