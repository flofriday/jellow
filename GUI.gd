extends CanvasLayer
 
signal start_game

var score = 0

func _ready():
	$MarginContainer/ScoreLabel.visible = false
	$StartUI/CenterContainer/VBoxContainer/Score.visible = false

func _on_Button_pressed():
	$StartUI.visible = false
	set_score(0)
	$MarginContainer/ScoreLabel.visible = true	
	emit_signal("start_game")

func show_game_over():
	$StartUI/CenterContainer/VBoxContainer/Title.text = "Game Over"
	$StartUI/CenterContainer/VBoxContainer/Score.text = "Score: " + str(score)
	$StartUI/CenterContainer/VBoxContainer/Score.visible = true
	$StartUI.visible = true
	$MarginContainer/ScoreLabel.visible = false

func set_score(_score):
	score = _score
	$MarginContainer/ScoreLabel.text = str(score)
