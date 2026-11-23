extends StaticBody2D

const PINVENTORY = preload("uid://cpgk2eqdi50sl")
const BINVENTORY = preload("uid://dmp1s4seniqg7")

@export var collection : bin_type
var bin = BINVENTORY.instantiate()
var pinventory = PINVENTORY.instantiate()
var entered : bool
var garbage_type = ["appliances","batteries","cans","car_batteries","cardboard","electrical","food",
"furniture","garden","general","glass","hazardous","medical","mixed_recycling","motor_oil","plastic",
"rubble","scrap_metal","textiles","wood"]
var sharp = 0
var electrical = 0
var fumes = 0 
var radioactive = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(bin)
	bin.hide()
	add_child(pinventory)
	pinventory.hide()
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("interact"):
		globals.lockInput = 1
		pinventory.check_Inventory()
		bin.check_Inventory()
		bin.show()
		pinventory.show()
	if entered == true:
		pinventory.check_Inventory()
		bin.check_Inventory()
	if Input.is_action_just_pressed("escape") and entered == true:
		bin.hide()
		pinventory.hide()
		for key_value in globals.bin_inventory:
			if garbage_type[collection.acceptable_trash] == key_value:
				globals.player_inventory["money"] += globals.bin_inventory[garbage_type[collection.acceptable_trash]] * 0.1
			elif key_value != garbage_type[collection.acceptable_trash] and globals.bin_inventory[key_value] > 0: 
				globals.player_inventory["money"] -= globals.bin_inventory[key_value] * 0.1
			globals.bin_inventory[key_value] = 0
	




func _on_area_2d_area_entered(area: Area2D) -> void:
	entered = true
	

func _on_area_2d_area_exited(area: Area2D) -> void:
	entered = false

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	bin.z_index = 3
	pinventory.z_index = 3
	if globals.forklift == true:
		bin.global_position = globals.forklift_pos + Vector2(-100,-100)
		pinventory.global_position = globals.forklift_pos + Vector2(-400,-100)
	elif body is Player:
		bin.global_position = body.cam_coords() + Vector2(-100,-100)
		pinventory.global_position = body.cam_coords() + Vector2(-400,-100)
