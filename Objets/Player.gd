extends KinematicBody2D

onready var animPlayer = $AnimationPlayer

var velocity: = Vector2.ZERO

var speed: = Global.GRID_SIZE * 8
var jump: = Global.GRID_SIZE * 20
var gravity: = Global.GRID_SIZE * 58
var max_gravity: = gravity * 5

var is_jumping: bool

func _physics_process(delta: float) -> void:
	velocity.x = speed
	_gravity()
	_jump()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

	
func _jump() -> void:
	if Input.is_action_pressed("jump"):
		if !is_jumping:
			velocity.y = -jump
			anim_check()
			
func _gravity() -> void:
	if is_on_floor(): 
		is_jumping = false
	else:
		is_jumping = true
		velocity.y += gravity * get_physics_process_delta_time()
	
func anim_check() -> void:
	if animPlayer.is_playing():
		animPlayer.stop()
	animPlayer.play("Roll")
