extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter_exit"):
		if globals.forklift == true:
			if visible == false: visible = true
			else: visible = false
		else: visible = false
