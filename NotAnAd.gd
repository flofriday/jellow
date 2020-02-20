extends Panel

func _ready():
	# Generate a nice text for the current adds
	set_texts("Ads are bad for you", "Thats why this game has none", "More")

func set_texts(title, description, button):
	$MarginContainer/HBoxContainer/VBoxContainer/Header.text = title
	$MarginContainer/HBoxContainer/VBoxContainer/Text.text = description
	$MarginContainer/HBoxContainer/CenterContainer/Button.text = button

func _on_Button_pressed():
	OS.shell_open("https://github.com/flofriday/jellow")