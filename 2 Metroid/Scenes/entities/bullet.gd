extends Area2D

var direction: Vector2

# Called when the node enters the scene tree for the first time.
func setup(pos: Vector2, dir: Vector2):
	position = pos + dir * 16
	direction = dir

func _physics_process(delta: float) -> void:
	position += direction * 20 * delta
