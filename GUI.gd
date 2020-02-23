extends CanvasLayer
 
signal start_game
signal pause_game
signal unpause_game

func _ready():
	$StartUI.visible = true
	$GameUI.visible = false
	$PauseUI.visible = false
	$GameoverUI.visible = false

func _on_score_changed(_score, _highscore):
	$GameUI/MarginContainer/ScoreLabel.text = str(_score)
	$GameoverUI/VBoxContainer/CenterContainer/VBoxContainer/Score.text = "Score: %d\nHighscore: %d" % [_score, _highscore]

	if _score == _highscore:
		$GameoverUI/VBoxContainer/CenterContainer/VBoxContainer/Title.text = "New Highscore"
	else:
		$GameoverUI/VBoxContainer/CenterContainer/VBoxContainer/Title.text = "Game Over"


func _on_StartButton_pressed():
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

