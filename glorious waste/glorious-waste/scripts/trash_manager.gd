extends Node2D

const TRASH = preload("uid://c2kde2myuntvg")
const APPLIANCES = preload("uid://bb4bqqh1jr6fd")
const BATTERIES = preload("uid://b7p8nrv47a2hp")
const CANS = preload("uid://cx2xy18s5scg8")
const CARDBOARD = preload("uid://dlesak0xocq1c")
const CAR_BATTERIES = preload("uid://dmp7go37dr76a")
const ELECTRICAL = preload("uid://c1vknnlenfjvo")
const FOOD = preload("uid://x0xsopo1gx4e")
const FURNITURE = preload("uid://btjv6ahaw1yv")
const GARDEN = preload("uid://boisx3rlfixgl")
const GENERAL = preload("uid://dcvh187j4str0")
const GLASS = preload("uid://dx8v0n8w2fgiy")
const HAZARD = preload("uid://cs6ptndhg2g5c")
const MEDICAL = preload("uid://cn5w3yiati0de")
const MIXED = preload("uid://dt7corijhj1ub")
const OIL = preload("uid://b1ylunlix1hlu")
const PLASTIC = preload("uid://bboe45ujeej8a")
const RUBBLE = preload("uid://bss74yinousq")
const SCRAP_METAL = preload("uid://cutw7thrrc1fg")
const TEXTILES = preload("uid://cec5pol5xnmbk")
const WOOD = preload("uid://dax1ghbfyg4ro")
const GOLD = preload("uid://drvl8a5d7bg6u")
var garbage_type = ["appliances","batteries","cans","car_batteries","cardboard","electrical","food",
"furniture","garden","general","glass","hazardous","medical","mixed_recycling","motor_oil","plastic",
"rubble","scrap_metal","textiles","wood", "gold"]
var waste_list: Array[waste]
var bin = []
var tossed = []
# Called when the node enters the scene tree for the first time.
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
		
		waste_list = [appliance,battery,cans,cardboard,car_battery,electric,food,furniture,garden,general,glass,hazardous,medical,mixed,oil,plastic,rubble,scrap_metal,textiles,wood,gold]
		var random = randi() % 21
		var x = randi() % 300
		var y = randi() % 600
		for n in range (21):
			if random == n: 
				bin.append(waste_list[n])
				add_child(waste_list[n])
				bin[i].global_position.x += x
				bin[i].global_position.y += y
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		var count = 0
		for i in range(bin.size()):
			if is_instance_valid(bin[i]) == true: count +=1
		if count == 0: 
			globals.clear = true
		else:
			globals.clear = false
	if Input.is_action_just_pressed("escape"):
		var count = 0
		globals.damage["edge"] = 0
		globals.damage["gas"] = 0
		globals.damage["hazard"] = 0
		globals.damage["zap"] = 0

		for key_value in globals.player_inventory:
			if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "e_gloves" and key_value != "gas_mask" and key_value != "hazmat":
				if globals.player_inventory[key_value] > 0:
					globals.damage["edge"] += globals.player_inventory[key_value] * waste_list[count].sharp.sharp
					globals.damage["zap"] += globals.player_inventory[key_value] * waste_list[count].electric.electrical
					globals.damage["gas"] += globals.player_inventory[key_value] * waste_list[count].gasses.noxious
					globals.damage["hazard"] += globals.player_inventory[key_value] * waste_list[count].radioactive.radioactive
					

				count +=1
		print(globals.damage)







func _on_user_spawn(spawnCount: Variant, x: Variant, y: Variant) -> void:
	bin[spawnCount].global_position.x = x
	bin[spawnCount].global_position.y = y


func _on_timer_timeout() -> void:
	pass # Replace with function body.
