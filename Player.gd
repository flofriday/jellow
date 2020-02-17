extends KinematicBody2D


signal on_gameover

const SPEED_LIMIT = 400
const GRAVITY = 20
const JUMP = -800
const ACCELERATION = 40
const UP_DIRECTION = Vector2(0, -1)

var motion = Vector2()
var freeze = true

func set_animation(new):
	if $Sprite.animation != new:
		$Sprite.play(new)

func update_animation():
	if motion.x > 0:
		set_animation("right")
	elif motion.x < 0:
		set_animation("left")

func _physics_process(delta):
	# Exit if freeze is on
	if freeze:
		motion = Vector2()
		return
	
	# Get the user input
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, SPEED_LIMIT)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -SPEED_LIMIT)
	else:
		# Meh
		motion.x = motion.x * 0.9
		
	# Gravity
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
