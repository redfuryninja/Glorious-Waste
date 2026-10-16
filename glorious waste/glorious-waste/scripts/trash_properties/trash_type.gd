class_name type
extends Node
@onready var sprite: AnimatedSprite2D = $"../sprite"

@export_enum("appliances","batteries","cans","car_batteries","cardboard","electrical","food",
"furniture","garden","general","glass","hazadous","medical","mixed_recycling","motor_oil","plastic",
"rubble","scrap_metal","textiles","wood") var trash_type
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(trash_type)
	sprite.animation = str(trash_type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
