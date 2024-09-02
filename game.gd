extends Node2D


func spawn_grey_planes() -> void:
	var plane = preload("res://grey_plane.tscn").instantiate()
	%PlaneSpawner.progress_ratio = randf()
	plane.global_position = %PlaneSpawner.global_position
	add_child(plane)


func _on_timer_timeout() -> void:
	spawn_grey_planes()
