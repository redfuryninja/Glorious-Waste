extends Node2D
@onready var hp: AnimatedSprite2D = $InventoryColour/HP
@onready var weight: AnimatedSprite2D = $InventoryColour/Weight
@onready var gloves: AnimatedSprite2D = $InventoryColour/Gloves
@onready var gas_mask: AnimatedSprite2D = $InventoryColour/GasMask
@onready var hazmat: AnimatedSprite2D = $InventoryColour/Hazmat
@onready var furniture: AnimatedSprite2D = $InventoryColour/Furniture
@onready var medical: AnimatedSprite2D = $InventoryColour/Medical
@onready var scrap_metal: AnimatedSprite2D = $"InventoryColour/Scrap Metal"
@onready var general_waste: AnimatedSprite2D = $"InventoryColour/General Waste"
@onready var hazardous: AnimatedSprite2D = $InventoryColour/Hazardous
@onready var garden_waste: AnimatedSprite2D = $"InventoryColour/Garden Waste"
@onready var food: AnimatedSprite2D = $InventoryColour/Food
@onready var textiles: AnimatedSprite2D = $InventoryColour/Textiles
@onready var food___drink_cans: AnimatedSprite2D = $"InventoryColour/Food & Drink Cans"
@onready var electrical: AnimatedSprite2D = $InventoryColour/Electrical
@onready var wood___timber: AnimatedSprite2D = $"InventoryColour/Wood & Timber"
@onready var cardboard___paper: AnimatedSprite2D = $"InventoryColour/Cardboard & Paper"
@onready var plastic_bottles: AnimatedSprite2D = $"InventoryColour/Plastic Bottles"
@onready var car_batteries: AnimatedSprite2D = $"InventoryColour/Car Batteries"
@onready var batteries: AnimatedSprite2D = $InventoryColour/Batteries
@onready var rubble_and_hardcore: AnimatedSprite2D = $"InventoryColour/Rubble and Hardcore"
@onready var glass: AnimatedSprite2D = $InventoryColour/Glass
@onready var mixed_recycling: AnimatedSprite2D = $"InventoryColour/Mixed Recycling"
@onready var motor_oil: AnimatedSprite2D = $"InventoryColour/Motor Oil"
@onready var appliances: AnimatedSprite2D = $InventoryColour/Appliances

@onready var health: Label = $InventoryColour/HP/health
@onready var carry: Label = $InventoryColour/Weight/carry
@onready var furnishing: Label = $InventoryColour/Furniture/furnishing
@onready var medicine: Label = $InventoryColour/Medical/medicine
@onready var metal: Label = $"InventoryColour/Scrap Metal/metal"
@onready var general: Label = $"InventoryColour/General Waste/general"
@onready var nuclear: Label = $InventoryColour/Hazardous/nuclear
@onready var green: Label = $"InventoryColour/Garden Waste/green"
@onready var food_stuff: Label = $InventoryColour/Food/food_stuff
@onready var fabric: Label = $InventoryColour/Textiles/fabric
@onready var cans: Label = $"InventoryColour/Food & Drink Cans/cans"
@onready var electric: Label = $InventoryColour/Electrical/electric
@onready var wood: Label = $"InventoryColour/Wood & Timber/wood"
@onready var cardboard: Label = $"InventoryColour/Cardboard & Paper/cardboard"
@onready var bottles: Label = $"InventoryColour/Plastic Bottles/bottles"
@onready var car_battery: Label = $"InventoryColour/Car Batteries/car_battery"
@onready var battery: Label = $InventoryColour/Batteries/battery
@onready var rubble: Label = $"InventoryColour/Rubble and Hardcore/rubble"
@onready var glass_items: Label = $InventoryColour/Glass/glass_items
@onready var mixed: Label = $"InventoryColour/Mixed Recycling/mixed"
@onready var oil: Label = $"InventoryColour/Motor Oil/oil"
@onready var appliance: Label = $InventoryColour/Appliances/appliance


var slot0 = true
var slot1 = true
var slot2 = false
var slot3 = false
var slot4 = false
var slot5 = false
var slot6 = false
var slot7 = false
var slot8 = false
var slot9 = false
var slot10 = false
var slot11 = false
var slot12 = false
var slot13 = false
var slot14 = false
var slot15 = false
var slot16 = false
var slot17 = false
var slot18 = false
var slot19 = false
var slot20 = false
var slot21 = false
var slot22 = false
var slot23 = false
var slot24 = false

func check_inventory():
	if globals.player_inventory["hp"] >= 0.0: slot0 = true
	if globals.player_inventory["mass"] >= 0.0: slot1 = true
	if globals.player_inventory["gloves"]> 0: slot2 = true
	if globals.player_inventory["gas_mask"]> 0: slot3 = true
	if globals.player_inventory["hazmat"]> 0: slot4 = true
	if globals.player_inventory["furniture"]> 0: slot5 = true
	if globals.player_inventory["medical"]> 0: slot6 = true
	if globals.player_inventory["scrap_metal"]> 0: slot7 = true
	if globals.player_inventory["general"]> 0: slot8 = true
	if globals.player_inventory["hazardous"]> 0: slot9 = true
	if globals.player_inventory["garden"]> 0: slot10 = true
	if globals.player_inventory["food"]> 0: slot11 = true
	if globals.player_inventory["textiles"]> 0: slot12 = true
	if globals.player_inventory["cans"]> 0: slot13 = true
	if globals.player_inventory["electrical"]> 0: slot14 = true
	if globals.player_inventory["wood"]> 0: slot15 = true
	if globals.player_inventory["cardboard"]> 0: slot16 = true
	if globals.player_inventory["plastic"]> 0: slot17 = true
	if globals.player_inventory["car_batteries"]> 0: slot18 = true
	if globals.player_inventory["batteries"]> 0: slot19 = true
	if globals.player_inventory["rubble"]> 0: slot20 = true
	if globals.player_inventory["glass"]> 0: slot21 = true
	if globals.player_inventory["mixed_recycling"]> 0: slot22 = true
	if globals.player_inventory["motor_oil"]> 0: slot23 = true
	if globals.player_inventory["appliances"]> 0: slot24 = true

func show_inventory():
	if slot0 == true: hp.show()
	else: hp.hide()
	if slot1 == true: weight.show()
	else: weight.hide()
	if slot2 == true: gloves.show()
	else: gloves.hide()
	if slot3 == true: gas_mask.show()
	else: gas_mask.hide()
	if slot4 == true: hazmat.show()
	else: hazmat.hide()
	if slot5 == true: furniture.show()
	else: furniture.hide()
	if slot6 == true: medical.show()
	else: medical.hide()
	if slot7 == true: scrap_metal.show()
	else: scrap_metal.hide()
	if slot8 == true: general_waste.show()
	else: general_waste.hide()
	if slot9 == true: hazardous.show()
	else: hazardous.hide()
	if slot10 == true: garden_waste.show()
	else: garden_waste.hide()
	if slot11 == true: food.show()
	else: food.hide()
	if slot12 == true: textiles.show()
	else: textiles.hide()
	if slot13 == true: food___drink_cans.show()
	else: food___drink_cans.hide()
	if slot14 == true: electrical.show()
	else: electrical.hide()
	if slot15 == true: wood___timber.show()
	else: wood___timber.hide()
	if slot16 == true: cardboard___paper.show()
	else: cardboard___paper.hide()
	if slot17 == true: plastic_bottles.show()
	else: plastic_bottles.hide()
	if slot18 == true: car_batteries.show()
	else: car_batteries.hide()
	if slot19 == true: batteries.show()
	else: batteries.hide()
	if slot20 == true: rubble_and_hardcore.show()
	else: rubble_and_hardcore.hide()
	if slot21 == true: glass.show()
	else: glass.hide()
	if slot22 == true: mixed_recycling.show()
	else: mixed_recycling.hide()
	if slot23 == true: motor_oil.show()
	else: motor_oil.hide()
	if slot24 == true: appliances.show()
	else: appliances.hide()
# Called when the node enters the scene tree for the first time.
func label_update():
	health.text =  str(globals.player_inventory["hp"])
	carry.text = str(globals.player_inventory["mass"]) + "/" + str(globals.max_kg)
	furnishing.text = "x" + str(globals.player_inventory["furniture"])
	medicine.text = "x" + str(globals.player_inventory["medical"])
	metal.text = "x" + str(globals.player_inventory["scrap_metal"])
	general.text = "x" + str(globals.player_inventory["general"])
	nuclear.text = "x" + str(globals.player_inventory["hazardous"])
	green.text = "x" + str(globals.player_inventory["garden"])
	food_stuff.text = "x" + str(globals.player_inventory["food"])
	fabric.text = "x" + str(globals.player_inventory["textiles"])
	cans.text = "x" + str(globals.player_inventory["cans"])
	electric.text = "x" + str(globals.player_inventory["electrical"])
	wood.text = "x" + str(globals.player_inventory["wood"])
	cardboard.text = "x" + str(globals.player_inventory["cardboard"])
	bottles.text = "x" + str(globals.player_inventory["plastic"])
	car_battery.text = "x" + str(globals.player_inventory["car_batteries"])
	battery.text = "x" + str(globals.player_inventory["batteries"])
	rubble.text = "x" + str(globals.player_inventory["rubble"])
	glass_items.text = "x" + str(globals.player_inventory["glass"])
	mixed.text = "x" + str(globals.player_inventory["mixed_recycling"])
	oil.text = "x" + str(globals.player_inventory["motor_oil"])
	appliance.text = "x" + str(globals.player_inventory["appliances"])
	

func _ready() -> void:
	check_inventory()
	show_inventory()
	label_update()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update():
	check_inventory()
	show_inventory()
	label_update()


func _on_user_inventory_update() -> void:
	print("testing")
	check_inventory()
	show_inventory()
	label_update()
