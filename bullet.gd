extends Area2D

const SPEED = 400
var direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
