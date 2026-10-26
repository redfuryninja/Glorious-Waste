extends CharacterBody2D

@onready var shop: Control = $shop
var entered : bool
func _ready() -> void:
	shop.position.x += 50
	shop.hide()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and entered == true:
		shop.show()
	elif entered == false:
		shop.hide()

func _on_gloves_button_up() -> void:
	globals.player_inventory["gloves"] = 100.0


func _on_e_gloves_button_up() -> void:
	globals.player_inventory["e_gloves"] = 100.0


func _on_sell_gold_button_up() -> void:
	pass # Replace with function body.


func _on_gas_mask_button_up() -> void:
	globals.player_inventory["gas_mask"] = 100.0


func _on_hp_up_button_up() -> void:
	globals.max_hp += 50
	globals.player_inventory["hp"] += 50


func _on_bandages_button_up() -> void:
	globals.player_inventory["gloves"] = globals.max_hp


func _on_hazamat_suit_button_up() -> void:
	globals.player_inventory["hazmat"] = 100.0


func _on_weight_up_button_up() -> void:
	globals.max_kg += 50

func _on_next_day_button_up() -> void:
	var level_to_load: String = str("res://scenes/world.tscn")
	globals.reset()
	LoadingSystem.load_scene(level_to_load)


func _on_area_2d_area_entered(area: Area2D) -> void:
	entered = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	entered = false
