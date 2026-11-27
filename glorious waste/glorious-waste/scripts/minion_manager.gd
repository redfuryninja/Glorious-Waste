extends Node2D

const MINION = preload("uid://cpkkylf7x3r4v")
signal get_list
signal remove_item(remove)
var waste_list: Array[waste]
var employees: Array[CharacterBody2D]
@onready var appliance_bins: StaticBody2D = $"../bin folder/appliance_bins"
@onready var battery_bins: StaticBody2D = $"../bin folder/battery_bins"
@onready var can_bins: StaticBody2D = $"../bin folder/can_bins"
@onready var cardboard_bins: StaticBody2D = $"../bin folder/cardboard_bins"
@onready var car_battery_bins: StaticBody2D = $"../bin folder/car_battery_bins"
@onready var electrical_bins: StaticBody2D = $"../bin folder/electrical_bins"
@onready var food_bins: StaticBody2D = $"../bin folder/food_bins"
@onready var furniture_bins: StaticBody2D = $"../bin folder/furniture_bins"
@onready var garden_bins: StaticBody2D = $"../bin folder/garden_bins"
@onready var general_bins: StaticBody2D = $"../bin folder/general_bins"
@onready var glass_bins: StaticBody2D = $"../bin folder/glass_bins"
@onready var hazardous_bins: StaticBody2D = $"../bin folder/hazardous_bins"
@onready var medical_bins: StaticBody2D = $"../bin folder/medical_bins"
@onready var mixed_bins: StaticBody2D = $"../bin folder/mixed_bins"
@onready var motor_oil_bins: StaticBody2D = $"../bin folder/motor_oil_bins"
@onready var plastic_bins: StaticBody2D = $"../bin folder/plastic_bins"
@onready var rubble_bins: StaticBody2D = $"../bin folder/rubble_bins"
@onready var scrap_metal_bins: StaticBody2D = $"../bin folder/scrap_metal_bins"
@onready var textile_bins: StaticBody2D = $"../bin folder/textile_bins"
@onready var wood_bins: StaticBody2D = $"../bin folder/wood_bins"


var bin_list: Array[StaticBody2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bin_list = [appliance_bins, battery_bins, can_bins, car_battery_bins, cardboard_bins, electrical_bins, food_bins, furniture_bins, garden_bins,general_bins,glass_bins,hazardous_bins,medical_bins,mixed_bins,motor_oil_bins,
	plastic_bins,rubble_bins,scrap_metal_bins,textile_bins,wood_bins]
	acquire_list()
	var count = 0
	for i in range (50):
		var minion = MINION.instantiate()
		minion.goal1 = appliance_bins
		minion.goal_type.aim_type = count
		employees.append(minion)
		add_child(minion)
		count+=1
		if count >= 6: count = 0
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		var count = 0
		for i in range(employees.size()):
			if is_instance_valid(employees[i]) == true: count +=1
		if count == 0: 
			globals.clear = true
		else:
			globals.clear = false

func acquire_list():
	get_list.emit()

func _on_trash_manager_give_list(bin: Variant) -> void:
	waste_list = bin

func clear_item(remove):
	remove_item.emit(remove)
