extends Node3D

@onready var xr_origin: XROrigin3D = $XROrigin3D

var xr_interface: XRInterface

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
		
		# Connect to OpenXR's recenter signal
		xr_interface.pose_recentered.connect(_on_pose_recentered)
	else:
		print("OpenXR not initialized, please check if your headset is connected")

#Runs when you hold the Oculus/Meta button
func _on_pose_recentered() -> void:
	xr_origin.recenter_view()
