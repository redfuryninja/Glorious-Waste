extends CharacterBody2D




func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("trigger"):
		var level_to_load: String = str("res://scenes/world.tscn")
		globals.reset()
		LoadingSystem.load_scene(level_to_load)
