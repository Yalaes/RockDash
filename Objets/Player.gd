extends KinematicBody2D

onready var animPlayer = $AnimationPlayer
var velocity: = Vector2.ZERO
var speed: = Global.GRID_SIZE * 8
var jump: = Global.GRID_SIZE * 18
var gravity: = Global.GRID_SIZE * 105
var max_gravity: = gravity * 5
var is_jumping: bool = false
var can_move = false

func _physics_process(delta: float) -> void:
	
	if can_move:
		velocity.x = speed
		_jump()				
		velocity = move_and_slide(velocity, Vector2.UP)
		_gravity(delta)
		
		if is_on_floor():
			is_jumping = false	
				
		if !is_on_floor() and !is_jumping:
			anim_check()		
	else:
		_gravity(delta)		
				
func _jump() -> void:
	if Input.is_action_pressed("jump"):
		if !is_jumping:
			is_jumping = true
			velocity.y = -jump
			anim_check()
			
func _gravity(delta) -> void:
	velocity.y += gravity * delta
	
func anim_check() -> void:
	if animPlayer.is_playing():
		animPlayer.stop()
	animPlayer.play("Roll")

func _on_start_Timer_timeout() -> void:
	can_move = true
