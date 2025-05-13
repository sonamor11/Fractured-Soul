extends Node

@export var world_env: WorldEnvironment
const MAX_ITEMS := 8

var collected_items := 0
var target_saturation := 0.0

func _input(event):
	if event.is_action_pressed("itemCollect"):  # You will define this action below
		collect_item()

func collect_item():
	if collected_items < MAX_ITEMS:
		collected_items += 1
		target_saturation = float(collected_items) / MAX_ITEMS
		target_saturation = clamp(target_saturation, 0.0, 1.0)
		print("Collected item", collected_items, "/", MAX_ITEMS)

func _process(delta):
	if world_env and world_env.environment.adjustment_enabled:
		var current = world_env.environment.adjustment_saturation
		world_env.environment.adjustment_saturation = lerp(current, target_saturation, delta * 2)
