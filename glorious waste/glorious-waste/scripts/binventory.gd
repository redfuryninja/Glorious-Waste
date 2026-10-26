extends inventory
const BLANK = preload("uid://dvifob61lejfk")

func _init_items() -> void:
	var item_slots = item_container.get_children()
	for i in range(items.size()):
		items[i] = BLANK
		item_slots[i].item.itemResource = items[i]
