extends CharacterBody2D

const SPEED: int = 300
const SMOOTHING: float = 0.25
const TILT_MAX: float = 0.3
const SHOOT_COOLDOWN: int = 150  # Cooldown time in milliseconds


var tilt: float = 0.0
var shootSide: String
var last_shot_time: float = -SHOOT_COOLDOWN

func shoot(shootingPoint: String) -> void:
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	var shooting_point_right = %ShootingPointRight
	var shooting_point_left = %ShootingPointLeft
	
	if shootingPoint == "left":
		new_bullet.global_position = shooting_point_left.global_position
		var tilt_adjusted_rotation = rotation + tilt
		new_bullet.direction = Vector2.UP.rotated(tilt_adjusted_rotation)
	
	
	if shootingPoint == "right":
		new_bullet.global_position = shooting_point_right.global_position
		var tilt_adjusted_rotation = rotation + tilt
		new_bullet.direction = Vector2.UP.rotated(tilt_adjusted_rotation)
		
	get_tree().root.add_child(new_bullet)		



func _physics_process(_delta):
	if Input.is_action_pressed("move_right"):
		tilt = TILT_MAX
	elif Input.is_action_pressed("move_left"):
		tilt = -TILT_MAX
	else:
		tilt = 0.0
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction = direction.normalized()
	var target_velocity = direction * SPEED

	velocity = lerp(velocity, target_velocity, SMOOTHING)
	rotation = lerp(rotation, clamp(tilt, -TILT_MAX, TILT_MAX), 0.1)
	move_and_slide()
	
	if Input.is_action_pressed("shoot"):
		var current_time: int = Time.get_ticks_msec()
		if current_time - last_shot_time >= SHOOT_COOLDOWN:
			shoot(shootSide)
			last_shot_time = current_time
			if shootSide == "left":
				shootSide = "right"
			else:
				shootSide = "left"
