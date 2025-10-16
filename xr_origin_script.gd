extends XROrigin3D

@export var left_sword: Node
@export var right_sword: Node
@export var player_camera: XRCamera3D

func _process(_delta: float) -> void:
	pass

func _on_right_controller_button_pressed(button_name: String) -> void:
	if button_name == "ax_button":
		right_sword.toggle_sword(not right_sword.is_on)

func _on_left_controller_button_pressed(button_name: String) -> void:
	if button_name == "ax_button":
		left_sword.toggle_sword(not left_sword.is_on)

func recenter_view() -> void:
	if player_camera == null:
		return
		
	var camera_y_rotation = player_camera.global_transform.basis.get_euler().y
	var camera_position_on_floor = player_camera.global_position * Vector3(1, 0, 1)
	self.rotate_y(-camera_y_rotation)
	self.global_position -= camera_position_on_floor
