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
	if gloves > 0: gloves -= stabbed
	else: globals.player_inventory["hp"] -= stabbed
	if e_gloves > 0 : e_gloves -= electrified
	else: globals.player_inventory["hp"] -= electrified
	if gas_mask > 0: gas_mask -= gassed
	else: globals.player_inventory["hp"] -= gassed
	if hazmat > 0: hazmat -= radiated
	else: globals.player_inventory["hp"] -= radiated
	health.emit()
func move():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	direction = direction.normalized()
	if direction:
		if Input.is_action_pressed("up"):
			if sprite.animation != "up" : sprite.animation = "up"
		elif Input.is_action_pressed("down"):
			if sprite.animation != "down" : sprite.animation = "down"
		elif Input.is_action_pressed("left"):
			if sprite.animation != "left" : sprite.animation = "left"
		elif Input.is_action_pressed("right"):
			if sprite.animation != "right" : sprite.animation = "right"
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	move_and_slide()

var inventory = INVENTORY.instantiate()
func _physics_process(delta: float) -> void:
	
	if lockInput == 0:
		move()
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
		for key_value in globals.player_inventory:
			if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "gas_mask" and key_value != "hazmat" and globals.player_inventory[key_value] > 0.0:
				globals.damage["holding"] = true
			else: globals.damage["holding"] = false
			print(globals.damage["holding"])
				
	if Input.is_action_just_pressed("trigger"):
		spawn.emit(spawnCount, position.x, position.y)
		spawnCount += 1
		if spawnCount >= 5:
			spawnCount = 0
	if Input.is_action_just_pressed("interact"):
		print("inventory")
		inventory_update.emit()
		weight.emit()
		
		
	# if item in inventory does not equal 0 then holding = true
