extends Control
var State = preload("res://Scripts/states.gd").State


func _on_play_button_pressed():
	States.change_state(State.play)

func _process(delta):
	if States.state==State.menu and Input.is_action_just_pressed("ui_accept"):
		States.change_state(State.play)
