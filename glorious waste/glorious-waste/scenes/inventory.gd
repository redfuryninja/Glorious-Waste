extends Node2D
@onready var hp: AnimatedSprite2D = $InventoryColour/HP

var slot0 = true
var slot1 = true
var slot2 = true
var slot3 = true
var slot4 = true
var slot5 = true
var slot6 = true
var slot7 = true
var slot8 = true
var slot9 = true
var slot10 = true
var slot11 = true
var slot12 = true
var slot13 = true
var slot14 = true
var slot15 = true
var slot16 = true
var slot17 = true
var slot18 = true
var slot19 = true
var slot20 = true
var slot21 = true
var slot22 = true
var slot23 = true
var slot24 = true
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if slot0 == true: hp.show()
	else: hp.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
