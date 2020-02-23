extends Panel

const texts = [
	["Ads are bad for you", "Thats why this game has none", "Learn More"],
	["Enjoy the game?", "Buy me a beer!", "Open"],
	["No annoying ads!", "Because nobody likes those!", "More"],
]

var rng = RandomNumberGenerator.new()

func _ready():
	new_texts()

func new_texts():
	# Generate a nice text for the current adds
	var text = texts[rng.randi_range(0, len(texts) - 1)]
	set_texts(text[0], text[1], text[2])

func set_texts(title, description, button):
	$MarginContainer/HBoxContainer/VBoxContainer/Header.text = title
	$MarginContainer/HBoxContainer/VBoxContainer/Text.text = description
	$MarginContainer/HBoxContainer/CenterContainer/Button.text = button

func _on_Button_pressed():
	OS.shell_open("https://github.com/flofriday/jellow")

func _on_NotAnAd_visibility_changed():
	new_texts()