extends Player

@onready var sprites: AnimatedSprite2D = $AnimatedSprite2D


func move():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	direction = direction.normalized()
	if direction:
		if Input.is_action_pressed("left"):
			if sprites.animation != "left" : sprites.animation = "left"
		elif Input.is_action_pressed("right"):
			if sprites.animation != "right" : sprites.animation = "right"
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	move_and_slide()


func _physics_process(delta: float) -> void:
	if entered == true and Input.is_action_just_pressed("enter_exit"):
		if globals.player_inventory["motor_oil"] > 0 and globals.player_inventory["car_batteries"] > 0:
			if globals.forklift == false: 
				globals.forklift = true
				globals.max_kg += 1000
				globals.fuel = globals.player_inventory["motor_oil"]
				globals.battery = globals.player_inventory["car_batteries"]
				globals.player_inventory["motor_oil"] = 0
				globals.player_inventory["car_batteries"] = 0
			else: 
				globals.forklift = false 
				globals.max_kg -= 1000
		elif globals.forklift == true and Input.is_action_just_pressed("enter_exit"): 
			globals.forklift = false 
			globals.max_kg -= 1000
		
		
	if globals.forklift == true and globals.battery > 0 and globals.fuel > 0:
		if globals.lockInput == 0:
			move()
			globals.forklift_pos = global_position
			globals.battery -= 0.005
			globals.fuel -= 0.01
		if Input.is_action_just_pressed("inventory"):
			globals.lockInput = 1
			inventory.update()
			inventory.global_position.x = position.x + 150
			inventory.global_position.y = position.y
			inventory.show()
		
		elif Input.is_action_just_pressed("escape"):
			globals.lockInput = 0
			inventory.hide()
			check_holding()

func _on_area_2d_body_exited(body: Node2D) -> void:
	weight.emit()
	
func cam_coords():
	return camera.get_screen_center_position()


func _on_area_2d_area_entered(area: Area2D) -> void:
	entered = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	entered = false
