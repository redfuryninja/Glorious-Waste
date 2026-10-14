extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $sprite
const INVENTORY = preload("uid://b4q2xpf83ksr5")
signal health(hp)
signal weight(kg)
signal spawn(spawnCount, x, y)
@export var speed = 300.0
const JUMP_VELOCITY = -400.0
var direction : Vector2
var hp = 100
var kg = 0
var spawnCount = 0
var lockInput = 0
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
		health.emit(str(hp))
		kg += 1
		weight.emit(str(kg))
		spawn.emit(spawnCount, position.x, position.y)
		spawnCount += 1
		if spawnCount >= 5:
			spawnCount = 0
		
