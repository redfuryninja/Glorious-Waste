extends MarginContainer
class_name ItemSlot
signal dropped_data()

@onready var item: Item = $Panel/Control/Item

func _get_drag_data(_at_position: Vector2) -> Item:
	if item.itemResource == null:
		return null
	else:
		var preview := TextureRect.new()
		preview.texture = item.itemResource.item_texture
		preview.custom_minimum_size = item.itemResource.item_texture.get_size()
		set_drag_preview(preview)
	
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
	print(parent)
	print(grandparent)
	print(g_grandparent)
	print(g_g_grandparent.name)
	item.itemResource = data.itemResource
	data.itemResource = temp

	#signal on item slot, emit every time dragged and drop, and emit up to inventory, when insitantiated when
