extends Node2D
class_name manager
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


func waste_setup():
	var appliance = APPLIANCES.instantiate()
	var battery = BATTERIES.instantiate()
	var cans = CANS.instantiate()
	var cardboard = CARDBOARD.instantiate()
	var car_battery = CAR_BATTERIES.instantiate()
	var electric = ELECTRICAL.instantiate()
	var food = FOOD.instantiate()
	var furniture = FURNITURE.instantiate()
	var garden = GARDEN.instantiate()
	var general = GENERAL.instantiate()
	var glass = GLASS.instantiate()
	var hazardous = HAZARD.instantiate()
	var medical = MEDICAL.instantiate()
	var mixed = MIXED.instantiate()
	var oil = OIL.instantiate()
	var plastic = PLASTIC.instantiate()
	var rubble = RUBBLE.instantiate()
	var scrap_metal = SCRAP_METAL.instantiate()
	var textiles = TEXTILES.instantiate()
	var wood = WOOD.instantiate()
	var gold = GOLD.instantiate()
	
	waste_list = [appliance,battery,cans,cardboard,car_battery,electric,food,furniture,garden,general,glass,hazardous,medical,mixed,oil,plastic,rubble,scrap_metal,textiles,wood,gold]



func track_details():
	var count = 0
	globals.damage["edge"] = 0
	globals.damage["gas"] = 0
	globals.damage["hazard"] = 0
	globals.damage["zap"] = 0
	for key_value in globals.player_inventory:
		if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "e_gloves" and key_value != "gas_mask" and key_value != "hazmat" and key_value != "gold":
			if globals.player_inventory[key_value] > 0:
				globals.damage["edge"] += globals.player_inventory[key_value] * waste_list[count].sharp.sharp
				globals.damage["zap"] += globals.player_inventory[key_value] * waste_list[count].electric.electrical
				globals.damage["gas"] += globals.player_inventory[key_value] * waste_list[count].gasses.noxious
				globals.damage["hazard"] += globals.player_inventory[key_value] * waste_list[count].radioactive.radioactive
	track_weight()

func track_weight():
	var count = 0
	globals.player_inventory["mass"] = 0
	for key_value in globals.player_inventory:
		if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "e_gloves" and key_value != "gas_mask" and key_value != "hazmat" and key_value != "gold":
			if globals.player_inventory[key_value] > 0:
				globals.player_inventory["mass"] += globals.player_inventory[key_value] * waste_list[count].weight.weight
				print(globals.player_inventory["mass"])
			count +=1


func drop_items(pos):
	var count = 0
	for key_value in globals.player_inventory:
		if globals.player_inventory["mass"] >= globals.max_kg:
			if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "e_gloves" and key_value != "gas_mask" and key_value != "hazmat":
				for i in range(globals.player_inventory[key_value]+1):
					print(key_value, "= ", globals.player_inventory[key_value])
					var x = randi() % 100
					var y = randi() % 100
					var coord: Vector2
					coord = Vector2(x,y)
					if key_value != "gold" and globals.player_inventory["mass"] >= globals.max_kg:
						print("check 1")
						if globals.player_inventory[key_value] > 0:
							waste_setup()
							print("creating", i)
							bin.append(waste_list[count])
							add_child(waste_list[count])
							bin.back().global_position = pos + coord
							globals.player_inventory[key_value] -= 1
				count +=1
	track_details()


func _on_user_inventory_update() -> void:
	track_details()


func _on_user_drop(pos) -> void:
	drop_items(pos)
