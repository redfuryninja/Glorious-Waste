extends inventory

func _init_items() -> void:
	var item_slots = item_container.get_children()
	for i in range(items.size()):
		items[i] = BLANK
		item_slots[i].item.itemResource = items[i]
	check_Inventory()


func check_Inventory():
	var item_slots = item_container.get_children()
	if globals.bin_inventory["appliances"] > 0.0: items[0] = APPLIANCES
	else: items[0] = BLANK
	if globals.bin_inventory["batteries"] > 0.0: items[1] = BATTERY
	else: items[1] = BLANK
	if globals.bin_inventory["cans"] > 0.0: items[2] = CANS
	else: items[2] = BLANK
	if globals.bin_inventory["cardboard"] > 0.0: items[3] = CARDBOARD
	else: items[3] = BLANK
	if globals.bin_inventory["car_batteries"] > 0.0: items[4] = CAR_BATTERY
	else: items[4] = BLANK
	if globals.bin_inventory["electrical"] > 0.0: items[5] = ELECTRICAL
	else: items[5] = BLANK
	if globals.bin_inventory["food"] > 0.0: items[6] = FOOD
	else: items[6] = BLANK
	if globals.bin_inventory["furniture"] > 0.0: items[7] = FURNITURE
	else: items[7] = BLANK
	if globals.bin_inventory["garden"] > 0.0: items[8] = GARDEN
	else: items[8] = BLANK
	if globals.bin_inventory["general"] > 0.0: items[9] = GENERAL
	else: items[9] = BLANK
	if globals.bin_inventory["glass"] > 0.0: items[10] = GLASS
	else: items[10] = BLANK
	if globals.bin_inventory["hazardous"] > 0.0: items[11] = HAZARD
	else: items[11] = BLANK
	if globals.bin_inventory["medical"] > 0.0: items[12] = MEDICAL
	else: items[12] = BLANK
	if globals.bin_inventory["scrap_metal"] > 0.0: items[13] = METAL
	else: items[13] = BLANK
	if globals.bin_inventory["mixed_recycling"] > 0.0: items[14] = MIXED
	else: items[14] = BLANK
	if globals.bin_inventory["motor_oil"] > 0.0: items[15] = OIL
	else: items[15] = BLANK
	if globals.bin_inventory["plastic"] > 0.0: items[16] = PLASTIC
	else: items[16] = BLANK
	if globals.bin_inventory["rubble"] > 0.0: items[17] = RUBBLE
	else: items[17] = BLANK
	if globals.bin_inventory["textiles"] > 0.0: items[18] = TEXTILES
	else: items[18] = BLANK
	if globals.bin_inventory["wood"] > 0.0: items[19] = WOOD
	else: items[19] = BLANK
	for i in range(items.size()):
		item_slots[i].item.itemResource = items[i]
