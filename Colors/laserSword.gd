extends Area3D

@export var sword_color: Color = Color.RED

@onready var line_renderer: MeshInstance3D = $LineRenderer
@onready var collision_shape: CollisionShape3D = $CollisionShape3D

var is_on: bool = false

func _ready() -> void:
	# Create a new material and set its color
	var mat = StandardMaterial3D.new()
	mat.albedo_color = sword_color

	mat.emission_enabled = true
	mat.emission = sword_color

	line_renderer.material_override = mat
	
	add_to_group("swords")
	print(name, " has been initialized and added to the 'swords' group.")
	toggle_sword(false)

func toggle_sword(state: bool) -> void:
	is_on = state
	line_renderer.visible = is_on
	collision_shape.disabled = not is_on
