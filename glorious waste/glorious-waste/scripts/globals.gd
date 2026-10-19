extends Node


var max_hp = 100.0
var max_kg = 100.0


var damage = {"holding": false, "edge": 0,"gas": 0,"hazard": 0,"zap": 0}
var player_inventory = {"hp":100.0, "mass":1.0, "money":0.0, "gloves": 0,"gas_mask": 0, "hazmat":0, "appliances" : 0,"batteries": 0,"cans": 0,"car_batteries": 0,"cardboard": 0,"electrical": 0,"food": 0,
"furniture": 0,"garden": 0,"general": 0,"glass": 0,"hazardous": 0,"medical": 0,"mixed_recycling": 0,"motor_oil": 0,"plastic": 0,
"rubble": 0,"scrap_metal": 0,"textiles": 0,"wood": 0}

var bin_inventory = {"appliances" : 0,"batteries": 0,"cans": 0,"car_batteries": 0,"cardboard": 0,"electrical": 0,"food": 0,
"furniture": 0,"garden": 0,"general": 0,"glass": 0,"hazardous": 0,"medical": 0,"mixed_recycling": 0,"motor_oil": 0,"plastic": 0,
"rubble": 0,"scrap_metal": 0,"textiles": 0,"wood": 0}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
