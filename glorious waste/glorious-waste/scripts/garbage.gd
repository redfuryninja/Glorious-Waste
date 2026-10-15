class_name waste
extends StaticBody2D
@onready var sprite: AnimatedSprite2D = $sprite

@export_category("properties")
@export var trash_type: type
@export var sharp: edge
@export var noxious: gas
@export var radioactive: hazard
@export var electric: zap
@export var weight: heavy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
