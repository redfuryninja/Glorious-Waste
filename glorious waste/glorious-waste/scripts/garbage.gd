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

signal stab(sharp)
signal fumes(noxious)
signal shock(electric)
signal radiation(radioactive)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_user_holding() -> void:
	stab.emit(sharp)
	fumes.emit(noxious)
	shock.emit(electric)
	radiation.emit(radioactive)
