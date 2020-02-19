extends Node2D

var platform = load("res://Rock.tscn")
var platform_size = platform.instance().get_node("CollisionShape2D").get_shape().extents

func _physics_process(delta):
	generate_platforms()
	remove_platforms()

func startup():
	# Get the players position and place a platform under it
	var player = get_owner().get_node("Player")
	addPlatform(player.position.x, player.position.y + 300)

func clear_all():
	for child in get_children():
		remove_child(child)
		child.queue_free()

func get_highest():
	var highest = 999999999
	if len(get_children()) == 0:
		return null

	for child in get_children():
		highest = min(highest, child.position.y)

	return highest

# This code generates platforms if necesarry
func generate_platforms():
	# Check if its needed to generate platforms
	var upper_limit = get_owner().get_node("CameraController").position.y - get_viewport().size.y/2
	upper_limit += 260
	var highest = get_highest()
	print(highest)
	if highest == null:
		return

	if upper_limit > highest:
		return

	var start = highest
	print("new platform at:" + str(start))
	var x = rand_range(0+platform_size.x, 600-platform_size.x)
	addPlatform(x, start - 210)

func remove_platforms():
	var lower_limit = get_owner().get_node("CameraController").position.y + get_viewport().size.y/2
	lower_limit -= 100
	for child in get_children():
		if child.position.y > lower_limit:
			remove_child(child)
			child.queue_free()

# This function adds a platform at the x and y cordinates provided
func addPlatform(x, y):
	var instance = platform.instance()
	instance.position.x = x
	instance.position.y = y
	add_child(instance)
