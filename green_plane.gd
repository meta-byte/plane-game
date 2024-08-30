extends CharacterBody2D

const SPEED = 700
const SMOOTHING = 0.25

func _physics_process(_delta):
	# Get input direction and normalize it
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction = direction.normalized()

	# Calculate target velocity
	var target_velocity = direction * SPEED

	# Smoothly interpolate current velocity towards the target velocity
	velocity = lerp(velocity, target_velocity, SMOOTHING)

	# Move the character using the smoothed velocity
	move_and_slide()
