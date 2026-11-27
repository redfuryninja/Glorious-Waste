extends CharacterBody2D
@onready var nav2d: NavigationAgent2D = $NavigationAgent2D


const SPEED = 700.0

@export var goal1 : Node2D = null
@export var goal2 : Node2D = null
var aim: Node2D = null

func _ready() -> void:
	aim = goal1
	nav2d.target_desired_distance = 60

func switch_goal():
	if aim == goal1:
		aim = goal2
		nav2d.target_desired_distance = 30
	elif aim == goal2:
		aim = goal1
		nav2d.target_desired_distance = 60

func _physics_process(delta: float) -> void:
	if is_instance_valid(aim):
		manual_navigation()
		#navigate(delta)
		navigate_safe()
	
	
	
	
	move_and_slide()
# will need to switch point, will need to get new point if player picks up trash before them
#instead of having one for each trash type, have one for each type of equipment used and have them go after the trash that applies to that



func manual_navigation():
	nav2d.target_position = aim.global_position

func navigate() -> void:
	if nav2d.is_navigation_finished():
		switch_goal()
	var next_path_position: Vector2 = nav2d.get_next_path_position()
	velocity = (global_position.direction_to(next_path_position)*SPEED)
	move_and_slide()

func navigate_safe() -> void:
	if nav2d.is_navigation_finished():
		switch_goal()
	var next_path_position: Vector2 = nav2d.get_next_path_position()
	var new_velocity: Vector2 = (global_position.direction_to(next_path_position)*SPEED)
	nav2d.velocity = new_velocity

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()
	
