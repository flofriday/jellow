extends Node2D


func startup():
	# Get the players position and place a platform under it
	var player = get_owner().get_node("Player")
	addPlatform(player.position.x, player.position.y + 300)
	generatePlatforms()
	
# This code generates platforms if necesarry
func generatePlatforms():
	# Todo: modify this to only generate if necessary
	var start = 600
	for i in range(100):
		var x = rand_range(0, 600)
		addPlatform(x, start - (250 * i))

# This function adds a platform at the x and y cordinates provided
func addPlatform(x, y):
	var scene = load("res://Rock.tscn")
	var instance = scene.instance()
	instance.position.x = x
	instance.position.y = y
	add_child(instance)
