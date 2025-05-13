extends CharacterBody2D

@export var speed: float = 200.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
		
		
	if direction.length() == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")


	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()

		# Flip sprite depending on horizontal direction
	if direction.x > 0:
		animated_sprite.flip_h = true
	elif direction.x < 0:
		animated_sprite.flip_h = false
