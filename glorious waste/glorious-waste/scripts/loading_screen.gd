extends CanvasLayer

@onready var fade_node: Node2D = $fade
@onready var progress_bar: ProgressBar = $fade/ProgressBar


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func update_load_progress(progress: float) -> void:
	progress_bar.value = progress * 100.0

func loading_complete() -> void:
	progress_bar.value = progress_bar.max_value
	var hide_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
	hide_tween.tween_interval(0.2)
	hide_tween.tween_property(fade_node, "modulate:a", 0.0, 0.15).connect("finished", queue_free)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
