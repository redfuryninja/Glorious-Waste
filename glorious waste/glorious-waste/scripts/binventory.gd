extends inventory
const BLANK = preload("uid://dvifob61lejfk")

func _init_items() -> void:
	var item_slots = item_container.get_children()
	for i in range(items.size()):
		items[i] = BLANK
		item_slots[i].item.itemResource = items[i]
	check_Inventory()


func check_Inventory():
	var item_slots = item_container.get_children()
	if globals.bin_inventory["appliances"] > 0.0: items[0] = APPLIANCES
	if globals.bin_inventory["batteries"] > 0.0: items[1] = BATTERY
	if globals.bin_inventory["cans"] > 0.0: items[2] = CANS
	if globals.bin_inventory["cardboard"] > 0.0: items[3] = CARDBOARD
	if globals.bin_inventory["car_batteries"] > 0.0: items[4] = CAR_BATTERY
	if globals.bin_inventory["electrical"] > 0.0: items[5] = ELECTRICAL
	if globals.bin_inventory["food"] > 0.0: items[6] = FOOD
	if globals.bin_inventory["furniture"] > 0.0: items[7] = FURNITURE
	if globals.bin_inventory["garden"] > 0.0: items[8] = GARDEN
	if globals.bin_inventory["general"] > 0.0: items[9] = GENERAL
	if globals.bin_inventory["glass"] > 0.0: items[10] = GLASS
	if globals.bin_inventory["hazardous"] > 0.0: items[11] = HAZARD
	if globals.bin_inventory["medical"] > 0.0: items[12] = MEDICAL
	if globals.bin_inventory["scrap_metal"] > 0.0: items[13] = METAL
	if globals.bin_inventory["mixed_recycling"] > 0.0: items[14] = MIXED
	if globals.bin_inventory["motor_oil"] > 0.0: items[15] = OIL
	if globals.bin_inventory["plastic"] > 0.0: items[16] = PLASTIC
	if globals.bin_inventory["rubble"] > 0.0: items[17] = RUBBLE
	if globals.bin_inventory["textiles"] > 0.0: items[18] = TEXTILES
	if globals.bin_inventory["wood"] > 0.0: items[19] = WOOD
	for i in range(items.size()):
		item_slots[i].item.itemResource = items[i]
