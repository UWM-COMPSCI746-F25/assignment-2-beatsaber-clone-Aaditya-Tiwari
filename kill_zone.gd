extends Area3D

func _on_area_entered(area: Area3D) -> void:
	if not area.is_in_group("swords"):
		area.queue_free()
