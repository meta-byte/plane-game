extends CharacterBody2D

const SPEED = 100
var direction: Vector2 = Vector2.DOWN

func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
	move_and_slide()
