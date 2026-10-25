extends inventory

func _init_items() -> void:
	var item_slots = item_container.get_children()
	for i in range(items.size()):
		item_slots[i].item.itemResource = items[i]
