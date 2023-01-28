extends KinematicBody2D
var State = preload("res://Scripts/states.gd").State
export var jumpforce: float = 400
var velocity : Vector2
export var gravity : float = 500
var canjump : bool = true

func die():
	$AnimatedSprite.play("dead")

func fly():
	$AnimatedSprite.play("fly")

func _physics_process(delta):
	if States.state==State.play:
		velocity.y += gravity*delta
		move_and_slide(velocity)

func _input(event: InputEvent):
	if States.state==State.play and event is InputEventScreenTouch:
		if event.pressed == true and canjump == true:
			jump()

func _unhandled_key_input(event):
	if event.pressed == true and event.scancode == KEY_SPACE and canjump == true:
		jump()

func _on_Timer_timeout():
	canjump = true
	
func jump():
	velocity.y = -jumpforce 
	$Timer.start()
	canjump = false
