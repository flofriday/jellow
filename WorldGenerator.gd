extends Node2D

var platform = load("res://Rock.tscn")
var platform_size = platform.instance().get_node("CollisionShape2D").get_shape().extents

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
		var x = rand_range(0+platform_size.x, 600-platform_size.x)
		addPlatform(x, start - (210 * i))

# This function adds a platform at the x and y cordinates provided
func addPlatform(x, y):
	var instance = platform.instance()
	instance.position.x = x
	instance.position.y = y
	add_child(instance)
