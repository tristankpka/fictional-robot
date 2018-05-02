
extends KinematicBody2D

export (int) var speed = 200

var life = 100
var velocity = Vector2()
var Bullet = preload("res://Weapons/Bullet/Bullet.tscn")


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

	if Input.is_action_just_pressed('mouse_click'):
		shoot()
		

func shoot():
	# "Muzzle" is a Position2D placed at the barrel of the gun
	var b = Bullet.instance()
	b.start($Muzzle.global_position, rotation)
	get_parent().add_child(b)
	get_node("Sound").play(float("pistol_sound"))

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
	look_at(get_global_mouse_position())