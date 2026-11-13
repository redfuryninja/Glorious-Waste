extends Control
class_name inventory

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
const BLANK = preload("uid://dvifob61lejfk")



func _ready() -> void:
	_init_slots()
	_init_items()
	
func _init_slots() -> void:
	_remove_all_children(item_container)
	
	for i in range (max_inventory_size):
		item_container.add_child(ITEM_SLOT_SCENE.instantiate())
		#signal on item slot, emit every time dragged and drop, and emit up to inventory, when insitantiated when
		
		
func _remove_all_children(parent: Node) -> void:
	for child in parent.get_children():
		child.free()
		
func _init_items() -> void:
	check_Inventory()
	
func update():
	var item_slots = item_container.get_children()
	for i in range(items.size()):
		item_slots[i].item.itemResource = items[i]

	
func check_Inventory():
	var item_slots = item_container.get_children()
	if globals.player_inventory["appliances"] > 0.0: items[0] = APPLIANCES
	else: items[0] = BLANK
	if globals.player_inventory["batteries"] > 0.0: items[1] = BATTERY
	else: items[1] = BLANK
	if globals.player_inventory["cans"] > 0.0: items[2] = CANS
	else: items[2] = BLANK
	if globals.player_inventory["cardboard"] > 0.0: items[3] = CARDBOARD
	else: items[3] = BLANK
	if globals.player_inventory["car_batteries"] > 0.0: items[4] = CAR_BATTERY
	else: items[4] = BLANK
	if globals.player_inventory["electrical"] > 0.0: items[5] = ELECTRICAL
	else: items[5] = BLANK
	if globals.player_inventory["food"] > 0.0: items[6] = FOOD
	else: items[6] = BLANK
	if globals.player_inventory["furniture"] > 0.0: items[7] = FURNITURE
	else: items[7] = BLANK
	if globals.player_inventory["garden"] > 0.0: items[8] = GARDEN
	else: items[8] = BLANK
	if globals.player_inventory["general"] > 0.0: items[9] = GENERAL
	else: items[9] = BLANK
	if globals.player_inventory["glass"] > 0.0: items[10] = GLASS
	else: items[10] = BLANK
	if globals.player_inventory["hazardous"] > 0.0: items[11] = HAZARD
	else: items[11] = BLANK
	if globals.player_inventory["medical"] > 0.0: items[12] = MEDICAL
	else: items[12] = BLANK
	if globals.player_inventory["scrap_metal"] > 0.0: items[13] = METAL
	else: items[13] = BLANK
	if globals.player_inventory["mixed_recycling"] > 0.0: items[14] = MIXED
	else: items[14] = BLANK
	if globals.player_inventory["motor_oil"] > 0.0: items[15] = OIL
	else: items[15] = BLANK
	if globals.player_inventory["plastic"] > 0.0: items[16] = PLASTIC
	else: items[16] = BLANK
	if globals.player_inventory["rubble"] > 0.0: items[17] = RUBBLE
	else: items[17] = BLANK
	if globals.player_inventory["textiles"] > 0.0: items[18] = TEXTILES
	else: items[18] = BLANK
	if globals.player_inventory["wood"] > 0.0: items[19] = WOOD
	else: items[19] = BLANK
	for i in range(items.size()):
		item_slots[i].item.itemResource = items[i]
	
