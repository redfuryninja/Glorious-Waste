extends MarginContainer
class_name ItemSlot


@onready var item: Item = $Panel/Control/Item

func _get_drag_data(_at_position: Vector2) -> Item:
	if item.itemResource == null:
		return null
	
	var preview := TextureRect.new()
	preview.texture = item.itemResource.item_texture
	preview.custom_minimum_size = item.itemResource.item_texture.get_size()
	set_drag_preview(preview)
	
	return item

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Item
	
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var temp = item.itemResource
	item.itemResource = data.itemResource
	data.itemResource = temp
