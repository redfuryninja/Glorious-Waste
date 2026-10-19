class_name waste
extends StaticBody2D

signal stab(sharp)
signal fumes(noxious)
signal shock(electric)
signal radiation(radioactive)

@export_category("properties")
@export var trash_type: type
@export var sharp: edge
@export var noxious: gas
@export var radioactive: hazard
@export var electric: zap
@export var weight: heavy

var can_pickup : bool

var garbage_type = ["appliances","batteries","cans","car_batteries","cardboard","electrical","food",
"furniture","garden","general","glass","hazadous","medical","mixed_recycling","motor_oil","plastic",
"rubble","scrap_metal","textiles","wood"]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_pickup == true and Input.is_action_just_pressed("interact"):
		globals.player_inventory[garbage_type[trash_type.trash_type]] += 1
		globals.player_inventory["mass"] += weight.weight
		globals.damage["edge"] += sharp.sharp
		globals.damage["gas"] += noxious.noxious
		globals.damage["hazard"] += radioactive.radioavtive
		globals.damage["zap"] += electric.electrical
		globals.damage["holding"] == true
		queue_free()





func _on_area_2d_area_entered(area: Area2D) -> void:
	can_pickup = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	can_pickup = false
