extends RigidBody2D

# TODO: fix that
func _physics_process(_delta):
	if len(get_colliding_bodies()) > 0:
		visible = false
		print("break")
