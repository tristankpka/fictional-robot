extends KinematicBody2D

export (int) var damage = 10

var speed = 2500
var velocity = Vector2()

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit_by_bullet"):
			collision.collider.hit_by_bullet(damage)
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()