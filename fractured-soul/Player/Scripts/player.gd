class_name Player extends CharacterBody2D

var move_speed = 100.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : PlayerStateMachine = $StateMachine

func _ready() -> void:
	state_machine.Initialize(self)
	pass

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	
	# Get input direction
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction = direction.normalized()

	# Handle animation
	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")

	# Flip sprite based on direction
	if direction.x > 0:
		animated_sprite.flip_h = true
	elif direction.x < 0:
		animated_sprite.flip_h = false

	# Move the character
	velocity = direction.normalized() * move_speed
	move_and_slide()
