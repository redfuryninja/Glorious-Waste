class_name Player
extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $sprite
const INVENTORY = preload("uid://b4q2xpf83ksr5")
signal health()
signal weight()
signal spawn(spawnCount, x, y)
signal holding()
signal inventory_update()
signal interact()
@export var speed = 400.0
const JUMP_VELOCITY = -400.0
var direction : Vector2
var max_hp = 100
var max_kg = 100
var hp = 100.0
var kg = 0.0
var money = 0.0
var spawnCount = 0
var lockInput = 0
var gloves = 0.0
var e_gloves = 0.0
var gas_mask = 0.0
var hazmat = 0.0
var stabbed = 0.0
var electrified = 0.0
var gassed = 0.0
var radiated = 0.0
var can_pickup : bool

var g = "g_"
var eg = "eg_"
var ng = "ng_"
var gm = "gm_"
var hm = "hm_"

func update_stats():
	globals.player_inventory["hp"] = hp
	globals.player_inventory["mass"] = kg
	globals.player_inventory["money"] = money
	globals.max_hp = max_hp
	globals.max_kg = max_kg



func _ready() -> void:
	update_stats()
	add_child(inventory)
	inventory.hide()

func damage():
	stabbed = globals.damage["edge"]
	electrified = globals.damage["zap"]
	radiated = globals.damage["hazard"]
	gassed = globals.damage["gas"]
	if gloves > 0: globals.player_inventory["gloves"]  -= stabbed
	else: globals.player_inventory["hp"] -= stabbed
	if e_gloves > 0 : globals.player_inventory["e_gloves"] -= electrified
	else: globals.player_inventory["hp"] -= electrified
	if gas_mask > 0: globals.player_inventory["gas_mask"]  -= gassed
	else: globals.player_inventory["hp"] -= gassed
	if hazmat > 0: globals.player_inventory["hazmat"]  -= radiated
	else: globals.player_inventory["hp"] -= radiated
	health.emit()
func move():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	direction = direction.normalized()
	if direction:
		if Input.is_action_pressed("up"):
			if sprite.animation != "ng_up" : sprite.animation = "ng_up"
		elif Input.is_action_pressed("down"):
			if sprite.animation != "ng_down" : sprite.animation = "ng_down"
		elif Input.is_action_pressed("left"):
			if sprite.animation != "ng_left" : sprite.animation = "ng_left"
		elif Input.is_action_pressed("right"):
			if sprite.animation != "ng_right" : sprite.animation = "ng_right"
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	move_and_slide()

func check_holding():
	for key_value in globals.player_inventory:
			if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "gas_mask" and key_value != "hazmat" and globals.player_inventory[key_value] > 0.0:
				globals.damage["holding"] = true
			else: globals.damage["holding"] = false
				

var inventory = INVENTORY.instantiate()

func _physics_process(delta: float) -> void:
	
	if lockInput == 0:
		move()
		if globals.damage["holding"] == true:
			damage()
		health.emit()
	if Input.is_action_just_pressed("inventory"):
		lockInput = 1
		inventory.update()
		inventory.show()
		inventory.global_position.x = position.x + 150
		inventory.global_position.y = position.y
		
	elif Input.is_action_just_pressed("escape"):
		lockInput = 0
		inventory.hide()
		check_holding()
	#if Input.is_action_just_pressed("trigger"):
		#spawn.emit(spawnCount, position.x, position.y)
		#spawnCount += 1
		#if spawnCount >= 100:
			#spawnCount = 0
	if Input.is_action_just_pressed("interact"):
		check_holding()


func _on_area_2d_body_exited(body: Node2D) -> void:
	weight.emit()
