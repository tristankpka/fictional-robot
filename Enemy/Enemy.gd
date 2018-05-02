extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed = 50

var velocity = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	var player_pos = $"../Player".position
	look_at(player_pos)
	velocity = Vector2(speed, 0).rotated(rotation)
	move_and_slide(velocity)