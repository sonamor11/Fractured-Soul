class_name State_Idle extends Node

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# What happens when the player enters this State?
func Enter() -> void:
	animated_sprite.play("idle")
	pass

# What happens when the player exits this State?
func Exit() -> void:
	pass

# What happens during the _process update in this State?
func Process(_delta : float) -> State:
	return null

# What happens during the _physics_process update in this State?
func Physics(_delta : float) -> State:
	return null

# What happens with input events in this State?
func HandleInput(_event : InputEvent) -> State:
	return null
