extends Node

func _ready():
	var center = get_viewport().size/2
	$CameraController.position = center
	$Player.position = center
	$Player.freeze = true
	$Player.visible = false

func _physics_process(delta):
	# Set the camera 
	if $CameraController.position.y > $Player.position.y:
		$CameraController.position.y = $Player.position.y
		$ScoreController.set_score(calc_score())

	# Set gameover if the player is lower than the camera
	if $Player.position.y > $CameraController.position.y + get_viewport().size.y/2:
		game_over();
	
func start_game():
	var center = get_viewport().size/2
	$CameraController.position = center
	$Player.position = center
	$Player.visible = true
	$Player.freeze = false
	$WorldGenerator.startup()
	$ScoreController.set_score(0)
	$HighscoreLine.visible = true
	set_highscore_line($ScoreController.get_highscore())
	
func game_over():
	var center = get_viewport().size/2
	$CameraController.position = center
	$WorldGenerator.clear_all()
	$GUI.show_game_over()
	$Player.position = center
	$Player.freeze = true
	$Player.visible = false
	$HighscoreLine.visible = false
	$ScoreController.save_highscore()

func calc_score():
	var center = get_viewport().size/2
	var pos = $Player.position.y - center.y
	return (pos / -100)

func set_highscore_line(y):
	# Don't draw a line for small highscores
	if y < 2: 
		$HighscoreLine.visible = false
		return

	y *= -100
	y += (get_viewport().size/2).y
	print(y)
	$HighscoreLine.clear_points()
	$HighscoreLine.add_point(Vector2(0, 0), 0)
	$HighscoreLine.add_point(Vector2(get_viewport().size.x, 0), 1)
	$HighscoreLine.position.y = y

# Start the game if the GUI says so
func _on_GUI_start_game():
	start_game()
