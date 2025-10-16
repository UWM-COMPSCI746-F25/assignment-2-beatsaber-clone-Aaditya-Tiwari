extends Node3D

@export var cube_scene: PackedScene

@onready var timer: Timer = $Timer

func _ready() -> void:
	pass

func _on_timer_timeout() -> void:
	var new_cube = cube_scene.instantiate()

	var x_pos = randf_range(-1.5, 1.5)
	var y_pos = randf_range(1.5, 1.8) 
	var z_pos = -15.0
	new_cube.global_position = Vector3(x_pos, y_pos, z_pos)

	get_tree().root.add_child(new_cube)

	new_cube.look_at(Vector3.ZERO, Vector3.UP)

	var random_color = Color.RED if randi() % 2 == 0 else Color.BLUE
	new_cube.set_color(random_color)

	timer.wait_time = randf_range(0.5, 2.0)
