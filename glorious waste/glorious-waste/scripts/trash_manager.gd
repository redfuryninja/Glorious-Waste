extends Node2D

const TRASH = preload("uid://c2kde2myuntvg")
var bin = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range (5):
		var newTrash = TRASH.instantiate()
		bin.append(newTrash)
		add_child(newTrash)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass







func _on_user_spawn(spawnCount: Variant, x: Variant, y: Variant) -> void:
	bin[spawnCount].global_position.x = x
	bin[spawnCount].global_position.y = y
