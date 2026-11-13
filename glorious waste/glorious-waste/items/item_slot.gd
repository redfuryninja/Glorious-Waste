extends MarginContainer
class_name ItemSlot

var origin_inventory: String
var drop_inventory: String
@onready var item: Item = $Panel/Control/Item

func _get_drag_data(_at_position: Vector2) -> Item:
	if item.itemResource == null:
		return null
	else:
		var preview := TextureRect.new()
		preview.texture = item.itemResource.item_texture
		preview.custom_minimum_size = item.itemResource.item_texture.get_size()
		set_drag_preview(preview)
	
	var parent = get_parent()
	var grandparent = parent.get_parent()
	var g_grandparent = grandparent.get_parent()
	var g_g_grandparent = g_grandparent.get_parent()

	print(g_g_grandparent.name)
	origin_inventory = g_g_grandparent.name
	return item

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Item
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var temp = item.itemResource
	print(data.itemResource)
	var parent = get_parent()
	var grandparent = parent.get_parent()
	var g_grandparent = grandparent.get_parent()
	var g_g_grandparent = g_grandparent.get_parent()

	print(g_g_grandparent.name)
	drop_inventory = g_g_grandparent.name
	print("dropped on ", item.itemResource.item_name)
	print("picked up = ", data.itemResource.item_name)

	if origin_inventory == "inventory_test" and drop_inventory == "binventory":
		if item.itemResource.item_name == "empty":
			globals.bin_inventory[data.itemResource.item_name] = globals.player_inventory[data.itemResource.item_name]
			globals.player_inventory[data.itemResource.item_name] = 0
		else:
			globals.bin_inventory[data.itemResource.item_name] = globals.player_inventory[data.itemResource.item_name]
			globals.player_inventory[data.itemResource.item_name] = 0
			globals.player_inventory[item.itemResource.item_name] = globals.bin_inventory[item.itemResource.item_name]
			globals.bin_inventory[item.itemResource.item_name] = 0
	#elif origin_inventory == "binventory" and drop_inventory == "inventory_test":
		#if item.itemResource.item_name == "empty":
			#globals.bin_inventory[data.itemResource.item_name] = globals.player_inventory[data.itemResource.item_name]
			#globals.player_inventory[data.itemResource.item_name] = 0
		#else:
			#globals.player_inventory[data.itemResource.item_name] = globals.bin_inventory[data.itemResource.item_name]
			#globals.bin_inventory[data.itemResource.item_name] = 0
			#globals.bin_inventory[item.itemResource.item_name] = globals.player_inventory[item.itemResource.item_name]
			#globals.player_inventory[item.itemResource.item_name] = 0
		#
	
	item.itemResource = data.itemResource
	data.itemResource = temp

	#signal on item slot, emit every time dragged and drop, and emit up to inventory, when insitantiated when
