extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_user_health() -> void:
	text = "HP: " + str(globals.player_inventory["hp"]) + "/" + str(globals.max_hp)


func _on_user_weight() -> void:
	text = "Weight: " + str(globals.player_inventory["weight"]) + "/" + str(globals.max_kg)
