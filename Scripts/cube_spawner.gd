extends Node3D

@export var cube_scene: PackedScene
@onready var timer: Timer = $Timer

func _ready() -> void:
	pass

func _on_timer_timeout() -> void:
	var new_cube = cube_scene.instantiate()
	var xr_origin = get_parent().get_node("XROrigin3D") 
	
	var x_pos = randf_range(-1.5, 1.5)
	var y_pos = randf_range(3, 3.4)
	var z_pos = -15.0
	new_cube.global_position = xr_origin.global_transform.origin + Vector3(x_pos, y_pos, z_pos)
	
	get_tree().root.add_child(new_cube)
	new_cube.call_deferred("look_at", Vector3.ZERO, Vector3.UP)
	
	var chosen_color = Color.RED if randi() % 2 == 0 else Color.BLUE
	new_cube.set_color(chosen_color)
	new_cube.speed = randf_range(2.5, 4.0)
	timer.wait_time = randf_range(0.5, 2.0)
