extends Control

signal start_game

func _on_Button_pressed():
	$StartUI.visible = false
	emit_signal("start_game")

func show_game_over():
	$StartUI/CenterContainer/VBoxContainer/Title.text = "Game Over"
	$StartUI.visible = true
