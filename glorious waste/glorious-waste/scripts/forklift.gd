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
		if globals.forklift == false: globals.forklift = true
		else: globals.forklift = false 
		print(globals.forklift)
	if globals.forklift == true:
		if lockInput == 0:
			move()
		
		if Input.is_action_just_pressed("inventory"):
			lockInput = 1
			inventory.update()
			inventory.global_position.x = position.x + 150
			inventory.global_position.y = position.y
			inventory.show()
		
		elif Input.is_action_just_pressed("escape"):
			lockInput = 0
			inventory.hide()
			check_holding()

		if Input.is_action_just_pressed("interact"):
			check_holding()
			if entered == true:
				lockInput = 1


func _on_area_2d_body_exited(body: Node2D) -> void:
	weight.emit()
	
func cam_coords():
	return camera.get_screen_center_position()


func _on_area_2d_area_entered(area: Area2D) -> void:
	entered = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	entered = false
