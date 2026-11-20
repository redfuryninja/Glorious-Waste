extends manager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if globals.player_inventory["mass"] > globals.max_kg:
		for key_value in globals.player_inventory:
			if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "e_gloves" and key_value != "gas_mask" and key_value != "hazmat":
	
	
	pass
