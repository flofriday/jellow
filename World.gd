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
	
func game_over():
	var center = get_viewport().size/2
	$CameraController.position = center
	$WorldGenerator.clear_all()
	$GUI.show_game_over()
	$Player.position = center
	$Player.freeze = true
	$Player.visible = false
	$ScoreController.save_highscore()

func calc_score():
	var center = get_viewport().size/2
	var pos = $Player.position.y - center.y
	return int(pos / 100) * -1

# Start the game if the GUI says so
func _on_GUI_start_game():
	start_game()
