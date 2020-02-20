extends CanvasLayer
 
signal start_game
signal pause_game
signal unpause_game

var score = 0

func _ready():
	set_score(0)
	$StartUI.visible = true
	$GameUI.visible = false
	$PauseUI.visible = false
	$GameoverUI.visible = false

func set_score(_score):
	score = _score
	$GameUI/MarginContainer/ScoreLabel.text = str(score)
	$GameoverUI/VBoxContainer/CenterContainer/VBoxContainer/Score.text = "Score: " + str(score)

func _on_StartButton_pressed():
	set_score(0)

	$StartUI.visible = false
	$GameUI.visible = true
	$PauseUI.visible = false
	$GameoverUI.visible = false	

	print("starting")

	emit_signal("start_game")

func show_game_over():
	$StartUI.visible = false
	$GameUI.visible = false
	$PauseUI.visible = false
	$GameoverUI.visible = true
