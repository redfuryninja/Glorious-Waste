extends Control

@export var items:Array[item_resource]
@export var max_inventory_size: int
@export var item_container: Control
const ITEM_SLOT_SCENE = preload("uid://i7eagvdvxsyh")
const APPLIANCES = preload("uid://dgreyll7tunfp")
const BATTERY = preload("uid://d1kxtmh4pr3jo")
const CANS = preload("uid://ckjop0cymag6w")
const CARDBOARD = preload("uid://k4xidfp87yn0")
const CAR_BATTERY = preload("uid://pifyugt35cvp")
const ELECTRICAL = preload("uid://brb5yne8187wg")
const FOOD = preload("uid://dycpmcmhx63jd")
const FURNITURE = preload("uid://dl76dc08w4qvw")
const GARDEN = preload("uid://b30es42tkgvgl")
const GENERAL = preload("uid://twowr1j15w87")
const GLASS = preload("uid://txr3bk3ntamh")
const HAZARD = preload("uid://xdaykpbi76kv")
const MEDICAL = preload("uid://djq1rg84g22l7")
const METAL = preload("uid://ccwd520n8r3v8")
const MIXED = preload("uid://bxc3usaxo368i")
const OIL = preload("uid://sudske35vt25")
const PLASTIC = preload("uid://ctjlvw5jqaxyb")
const RUBBLE = preload("uid://bgw3nhoal8gtw")
const TEXTILES = preload("uid://1l5ltdjvahvj")
const WOOD = preload("uid://bumporek6bivg")


func _ready() -> void:
	_init_slots()
	_init_items()
	
func _init_slots() -> void:
	_remove_all_children(item_container)
	
	for i in range (max_inventory_size):
		item_container.add_child(ITEM_SLOT_SCENE.instantiate())
		
		
		
func _remove_all_children(parent: Node) -> void:
	for child in parent.get_children():
		child.free()
		
func _init_items() -> void:
	var item_slots = item_container.get_children()
	_check_Inventory()
	for i in range(items.size()):
		item_slots[i].item.itemResource = items[i]
	
func _check_Inventory():
	if globals.player_inventory["appliaces"] >= 0.0: items[0] = APPLIANCES
	if globals.player_inventory["batteries"] >= 0.0: items[1] = BATTERY
	if globals.player_inventory["cans"] >= 0.0: items[2] = CANS
	if globals.player_inventory["cardboard"] >= 0.0: items[3] = CARDBOARD
	if globals.player_inventory["car_batteries"] >= 0.0: items[4] = CAR_BATTERY
	if globals.player_inventory["electrical"] >= 0.0: items[5] = ELECTRICAL
	if globals.player_inventory["food"] >= 0.0: items[6] = FOOD
	if globals.player_inventory["furniture"] >= 0.0: items[7] = FURNITURE
	if globals.player_inventory["garden"] >= 0.0: items[8] = GARDEN
	if globals.player_inventory["general"] >= 0.0: items[9] = GENERAL
	if globals.player_inventory["glass"] >= 0.0: items[10] = GLASS
	if globals.player_inventory["hazardous"] >= 0.0: items[11] = HAZARD
	if globals.player_inventory["medical"] >= 0.0: items[12] = MEDICAL
	if globals.player_inventory["scrap_metal"] >= 0.0: items[13] = METAL
	if globals.player_inventory["mixed_recycling"] >= 0.0: items[14] = MIXED
	if globals.player_inventory["motor_oil"] >= 0.0: items[15] = OIL
	if globals.player_inventory["plastic"] >= 0.0: items[16] = PLASTIC
	if globals.player_inventory["rubble"] >= 0.0: items[17] = RUBBLE
	if globals.player_inventory["textiles"] >= 0.0: items[18] = TEXTILES
	if globals.player_inventory["wood"] >= 0.0: items[19] = WOOD
	
