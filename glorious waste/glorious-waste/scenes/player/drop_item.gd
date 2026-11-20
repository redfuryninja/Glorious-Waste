extends manager
var garbage_type = ["appliances","batteries","cans","car_batteries","cardboard","electrical","food",
"furniture","garden","general","glass","hazardous","medical","mixed_recycling","motor_oil","plastic",
"rubble","scrap_metal","textiles","wood", "gold"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var appliance: waste = APPLIANCES.instantiate()
	var battery: waste = BATTERIES.instantiate()
	var cans: waste = CANS.instantiate()
	var cardboard: waste = CARDBOARD.instantiate()
	var car_battery: waste = CAR_BATTERIES.instantiate()
	var electric: waste = ELECTRICAL.instantiate()
	var food: waste = FOOD.instantiate()
	var furniture: waste = FURNITURE.instantiate()
	var garden: waste = GARDEN.instantiate()
	var general: waste = GENERAL.instantiate()
	var glass: waste = GLASS.instantiate()
	var hazardous: waste = HAZARD.instantiate()
	var medical: waste = MEDICAL.instantiate()
	var mixed: waste = MIXED.instantiate()
	var oil: waste = OIL.instantiate()
	var plastic: waste = PLASTIC.instantiate()
	var rubble: waste = RUBBLE.instantiate()
	var scrap_metal: waste = SCRAP_METAL.instantiate()
	var textiles: waste = TEXTILES.instantiate()
	var wood: waste = WOOD.instantiate()
	var gold: waste = GOLD.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if globals.player_inventory["mass"] > globals.max_kg:
		for key_value in globals.player_inventory:
			if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "e_gloves" and key_value != "gas_mask" and key_value != "hazmat":
				for item in garbage_type:
					if key_value == garbage_type:
						pass
	
	
	pass
func _ready() -> void:
	for i in range (500):
		var appliance: waste = APPLIANCES.instantiate()
		var battery: waste = BATTERIES.instantiate()
		var cans: waste = CANS.instantiate()
		var cardboard: waste = CARDBOARD.instantiate()
		var car_battery: waste = CAR_BATTERIES.instantiate()
		var electric: waste = ELECTRICAL.instantiate()
		var food: waste = FOOD.instantiate()
		var furniture: waste = FURNITURE.instantiate()
		var garden: waste = GARDEN.instantiate()
		var general: waste = GENERAL.instantiate()
		var glass: waste = GLASS.instantiate()
		var hazardous: waste = HAZARD.instantiate()
		var medical: waste = MEDICAL.instantiate()
		var mixed: waste = MIXED.instantiate()
		var oil: waste = OIL.instantiate()
		var plastic: waste = PLASTIC.instantiate()
		var rubble: waste = RUBBLE.instantiate()
		var scrap_metal: waste = SCRAP_METAL.instantiate()
		var textiles: waste = TEXTILES.instantiate()
		var wood: waste = WOOD.instantiate()
		var gold: waste = GOLD.instantiate()
		
		
		var random = randi() % 21
		var x = randi() % 300
		var y = randi() % 600
		for n in range (21):
			if random == n: 
				bin.append(waste_list[n])
				add_child(waste_list[n])
				bin[i].global_position.x += x
				bin[i].global_position.y += y
		
