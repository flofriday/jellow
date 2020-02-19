extends KinematicBody2D

const SPEED_LIMIT = 400
const GRAVITY = 20
const JUMP = -800
const ACCELERATION = 40
const UP_DIRECTION = Vector2(0, -1)

var motion = Vector2()
var freeze = true
var os_name = OS.get_name()

func set_animation(new):
	if $Sprite.animation != new:
		$Sprite.play(new)

# Update the animation depending of the players speed. 
func update_animation():
	if motion.x > 50:
		set_animation("right")
	elif motion.x < -50:
		set_animation("left")

# Since this is mainly a mobile game, this option is mostly used for
# developing. 
# Here we move the player with the keyboard
func user_input_desktop():
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, SPEED_LIMIT)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -SPEED_LIMIT)
	else:
		# Meh
		motion.x = motion.x * 0.9

# Here we move the player via the gyroscope (tilting of the phone)
func user_input_mobile():
	motion.x = Input.get_accelerometer().x * 100

func user_input():
	# Move the player depending on the user
	if os_name == "Android" or os_name == "iOS":
		user_input_mobile()
	else:
		user_input_desktop()

func _physics_process(_delta):
	# Exit if freeze is on
	if freeze:
		motion = Vector2()
		move_and_slide(motion, UP_DIRECTION)
		return
	
	# Get the user input
	user_input()
		
	# Gravitiy
	motion.y += GRAVITY
	
	# Jump
	if is_on_floor():
		motion.y += JUMP
		
	# Disable collision on the way up
	if motion.y < 0:
		$CollisionShape2D.disabled = true
	else:
		$CollisionShape2D.disabled = false
	
	# Move the body
	motion = move_and_slide(motion, UP_DIRECTION)
	
	# Animate the player
	update_animation()
