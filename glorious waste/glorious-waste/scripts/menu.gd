extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_up() -> void:
	var level_to_load: String = str("res://scenes/world.tscn")
	globals.reset()
	LoadingSystem.load_scene(level_to_load)


func _on_quit_button_up() -> void:
	get_tree().quit()
