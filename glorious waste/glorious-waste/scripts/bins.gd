extends StaticBody2D

const BINVENTORY = preload("uid://dmp1s4seniqg7")

@export var collection : bin_type
var bin = BINVENTORY.instantiate()
var entered : bool
var garbage_type = ["appliances","batteries","cans","car_batteries","cardboard","electrical","food",
"furniture","garden","general","glass","hazardous","medical","mixed_recycling","motor_oil","plastic",
"rubble","scrap_metal","textiles","wood"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(bin)
	bin.hide()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	

	if entered == true and Input.is_action_just_pressed("interact"):

		
		bin.show()
		var x = get_viewport().size.x - bin.size.x
		var y = get_viewport().size.y - bin.size.y
		bin.position = Vector2(x,y)
		
	if Input.is_action_just_pressed("escape"):
		bin.hide()



func _on_area_2d_area_entered(area: Area2D) -> void:
	entered = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	entered = false
