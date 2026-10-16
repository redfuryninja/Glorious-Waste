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
@export var speed = 300.0
const JUMP_VELOCITY = -400.0
var direction : Vector2
var max_hp = 100.0
var max_kg = 100.0
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
	globals.player_inventory["weight"] = weight
	globals.player_inventory["money"] = money
	globals.max_hp = max_hp
	globals.max_kg = max_kg


func _ready() -> void:
	update_stats()

func damage():
	if gloves > 0: gloves -= stabbed
	else: hp -= stabbed
	if e_gloves > 0 : e_gloves -= electrified
	else: hp -= electrified
	if gas_mask > 0: gas_mask -= gassed
	else: hp -= gassed
	if hazmat > 0: hazmat -= radiated
	else: hp -= radiated
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
	if Input.is_action_just_pressed("inventory"):
		lockInput = 1
		add_child(inventory)
		inventory.global_position.x = position.x + 150
		inventory.global_position.y = position.y
		
	elif Input.is_action_just_pressed("escape"):
		lockInput = 0
		remove_child(inventory)
	if Input.is_action_just_pressed("trigger"):
		hp -= 1
		globals.player_inventory["hp"] = hp
		health.emit()
		kg += 1
		globals.player_inventory["mass"] = kg
		weight.emit()
		spawn.emit(spawnCount, position.x, position.y)
		spawnCount += 1
		if spawnCount >= 5:
			spawnCount = 0
	if can_pickup == true and Input.is_action_just_pressed("interact"):
		interact.emit()
		inventory_update.emit()
		print("hmwcawcciawcccw",globals.player_inventory["wood"])




func _on_area_2d_body_entered(body: Node2D) -> void:
		if body is waste:
			can_pickup = true
			
			#if body.can_pickup:
				#body._on_user_interact()


func _on_area_2d_body_exited(body: Node2D) -> void:
	can_pickup = false
