extends Node

func _ready():
	var center = get_viewport().size/2
	$CameraController.position = center
	$Player.position = center
	$WorldGenerator.startup()

func _physics_process(delta):
	# Set the camera 
	if $CameraController.position.y > $Player.position.y:
		$CameraController.position.y = $Player.position.y

	# Set gameover if the player is lower than the camera
	if $Player.position.y > $CameraController.position.y + get_viewport().size.y:
		game_over();
		
func game_over():
	print("GAME OVER")
