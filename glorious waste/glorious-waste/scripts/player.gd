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
var gloves = false
var e_gloves = false
var gas_mask = false
var hazmat = false
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
var sprite_used = "ng_"

var inventory = INVENTORY.instantiate()


func sprite_check():
	if Input.is_action_just_pressed("gloves"):
		if globals.player_inventory["gloves"] > 0:
			if gloves == true: gloves = false
			else: gloves = true
		if globals.player_inventory["e_gloves"] > 0.0:
			if e_gloves == true: e_gloves = false
			else: e_gloves = true
	elif Input.is_action_just_pressed("gas_mask"):
		if globals.player_inventory["gas_mask"] > 0:
			if gas_mask == true: gas_mask = false
			else: gas_mask = true
	elif Input.is_action_just_pressed("hazmat_suit"):
		if globals.player_inventory["hazmat"] > 0:
			if hazmat == true: hazmat = false
			else: hazmat = true

	if globals.player_inventory["gloves"] <= 0: gloves = false
	if globals.player_inventory["e_gloves"] <= 0: e_gloves = false
	if globals.player_inventory["gas_mask"] <= 0: gas_mask = false
	if globals.player_inventory["hazmat"] <= 0: hazmat = false
	
	
	if hazmat == true:
		sprite_used = hm
	elif gas_mask == true:
			if e_gloves == true:sprite_used = gm+eg
			elif gloves == true:sprite_used = gm+g
			else: sprite_used = gm
	elif e_gloves == true: 
		sprite_used = eg 
		print("check")
	elif gloves == true: sprite_used = g
	else: sprite_used = ng


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
	if gloves == true and globals.player_inventory["gloves"] > 0: globals.player_inventory["gloves"]  -= stabbed
	else: globals.player_inventory["hp"] -= stabbed
	if e_gloves == true and globals.player_inventory["e_gloves"] > 0 : globals.player_inventory["e_gloves"] -= electrified
	else: globals.player_inventory["hp"] -= electrified
	if gas_mask == true and globals.player_inventory["gas_mask"] > 0: globals.player_inventory["gas_mask"]  -= gassed
	else: globals.player_inventory["hp"] -= gassed
	if hazmat == true and globals.player_inventory["hazmat"] > 0: globals.player_inventory["hazmat"]  -= radiated
	else: globals.player_inventory["hp"] -= radiated
	health.emit()
func move():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	direction = direction.normalized()
	if direction:
		if Input.is_action_pressed("up"):
			if sprite.animation != sprite_used + "up" : sprite.animation = sprite_used +  "up"
		elif Input.is_action_pressed("down"):
			if sprite.animation != sprite_used + "down" : sprite.animation = sprite_used + "down"
		elif Input.is_action_pressed("left"):
			if sprite.animation != sprite_used + "left" : sprite.animation = sprite_used + "left"
		elif Input.is_action_pressed("right"):
			if sprite.animation != sprite_used + "right" : sprite.animation = sprite_used + "right"
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	move_and_slide()

func check_holding():
	for key_value in globals.player_inventory:
			if key_value != "hp" and  key_value != "mass" and key_value != "money" and key_value != "gloves" and key_value != "e_gloves" and key_value != "gas_mask" and key_value != "hazmat":
				if globals.player_inventory[key_value] > 0.0:
					globals.damage["holding"] = true
			else: globals.damage["holding"] = false
				
			print(key_value, ": ", globals.damage["holding"])



func _physics_process(delta: float) -> void:
	sprite_check()
	if lockInput == 0:
		move()
		check_holding()
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
