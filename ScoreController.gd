# This node handles the score
extends Node

signal score_changed(_score, _highscore)

const file_path = "user://highscore.save"

var score = 0
var highscore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Load the highscore from disk
	load_highscore()

func set_score(number):
	# Set the score variables
	score = number;
	if score > highscore:
		highscore = number

	# Singal that the score has changed	
	emit_signal("score_changed", score, highscore)
		
func get_score():
	return score

func get_highscore():
	return highscore

# Save the highscore to disk
func save_highscore():
	var file = File.new()
	file.open(file_path, File.WRITE)
	file.store_string(str(highscore))
	file.close()

# Load the highscore from disk
func load_highscore():
	var file = File.new()
	if not file.file_exists(file_path):
		highscore = 0
		return

	file.open(file_path, File.READ)
	highscore = float(file.get_as_text())
	file.close()
