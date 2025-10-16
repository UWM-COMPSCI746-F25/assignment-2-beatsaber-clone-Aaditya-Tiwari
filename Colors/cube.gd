extends Area3D

@export var hit_sound: AudioStream
var speed: float = 5.0
var cube_color: Color

@onready var mesh: MeshInstance3D = $MeshInstance3D
@onready var sound_player: AudioStreamPlayer3D = $AudioStreamPlayer3D

func _process(delta: float) -> void:
	transform.origin += -transform.basis.z * speed * delta

func set_color(new_color: Color) -> void:
	cube_color = new_color
	var mat = StandardMaterial3D.new()
	mat.albedo_color = cube_color
	mesh.material_override = mat

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("swords") and area.sword_color.is_equal_approx(cube_color):
		visible = false
		get_node("CollisionShape3D").set_deferred("disabled", true)
		sound_player.stream = hit_sound
		sound_player.play()
		await sound_player.finished
		queue_free()
