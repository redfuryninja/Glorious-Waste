extends Node


var max_hp = 100
var max_kg = 100
var clear = false
var gloves = true
var e_gloves = true
var gas_mask = true
var hazmat = true
var damage = {"holding": false, "edge": 0.0,"gas": 0.0,"hazard": 0.0,"zap": 0.0}

var player_inventory = {"hp":100.0, "mass":0.0, "money":0.0, "gloves": 10.0, "e_gloves": 10.0, "gas_mask": 10.0, "hazmat":10.0, 
"appliances" : 1,"batteries": 0,"cans": 0,"car_batteries": 0,"cardboard": 0,"electrical": 0,"food": 0,
"furniture": 0,"garden": 0,"general": 0,"glass": 0,"hazardous": 0,"medical": 0,"mixed_recycling": 0,"motor_oil": 0,"plastic": 0,
"rubble": 0,"scrap_metal": 0,"textiles": 0,"wood": 0}

var bin_inventory = {"appliances" : 0,"batteries": 0,"cans": 0,"car_batteries": 0,"cardboard": 0,"electrical": 0,"food": 0,
"furniture": 0,"garden": 0,"general": 0,"glass": 0,"hazardous": 0,"medical": 0,"mixed_recycling": 0,"motor_oil": 0,"plastic": 0,
"rubble": 0,"scrap_metal": 0,"textiles": 0,"wood": 0}

func reset():
	clear = false

	damage = {"holding": false, "edge": 0.0,"gas": 0.0,"hazard": 0.0,"zap": 0.0}

	player_inventory = {"hp":max_hp, "mass":0.0, "money":0.0, "gloves": 100.0,"e_gloves": 00.0, "gas_mask": 100.0, "hazmat":100.0, 
	"appliances" : 0,"batteries": 0,"cans": 0,"car_batteries": 0,"cardboard": 0,"electrical": 0,"food": 0,
	"furniture": 0,"garden": 0,"general": 0,"glass": 0,"hazardous": 0,"medical": 0,"mixed_recycling": 0,"motor_oil": 0,"plastic": 0,
	"rubble": 0,"scrap_metal": 0,"textiles": 0,"wood": 0}
	
	if gloves == true: player_inventory["gloves"] = 100
	if e_gloves == true: player_inventory["e_gloves"] = 100
	if gas_mask == true: player_inventory["gas_mask"] = 100
	if hazmat == true: player_inventory["hazmat"] = 100
	
	bin_inventory = {"appliances" : 0,"batteries": 0,"cans": 0,"car_batteries": 0,"cardboard": 0,"electrical": 0,"food": 0,
	"furniture": 0,"garden": 0,"general": 0,"glass": 0,"hazardous": 0,"medical": 0,"mixed_recycling": 0,"motor_oil": 0,"plastic": 0,
	"rubble": 0,"scrap_metal": 0,"textiles": 0,"wood": 0}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
