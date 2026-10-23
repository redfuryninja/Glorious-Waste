extends Sprite2D
class_name Item

@export var itemResource: item_resource:
	set(value):
		itemResource = value
		
		if value:
			texture = itemResource.item_texture
		else:
			texture = null
