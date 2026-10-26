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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(bin)
	bin.hide()
	add_child(pinventory)
	pinventory.hide()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if entered == true:
		for item in bin.items:
			for key_value in globals.player_inventory:
				if item.item_name == key_value:
					globals.player_inventoryp["money"] = 0.1 + globals.player_inventory[key_value]
				else: print(item.item_name, " not == ",key_value)


	if entered == true and Input.is_action_just_pressed("interact"):
		pinventory.check_Inventory()
		bin.show()
		pinventory.show()
		
	if Input.is_action_just_pressed("escape"):
		bin.hide()
		pinventory.hide()



func _on_area_2d_area_entered(area: Area2D) -> void:
	entered = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	entered = false
	bin.hide()
	pinventory.hide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		print(body.cam_coords())
		bin.global_position = body.cam_coords() + Vector2(-100,-100)
		pinventory.global_position = body.cam_coords() + Vector2(-400,-100)
