extends Control
var State = preload("res://Scripts/states.gd").State

func _ready():
	Events.connect("score_changed", self, "_on_score_changed")
	
func _input(event: InputEvent):
	if States.state==State.dead and event is InputEventScreenTouch:
		if event.pressed == true:
			reload_game()
			
func _on_score_changed(score):
	$VBoxContainer/score.text = str(score)
	
func _process(_delta):
	if States.state==State.dead and Input.is_action_just_pressed("ui_accept"):
			reload_game()

func reload_game():
	States.change_state(State.menu)
	get_tree().change_scene("res://Scenes/game.tscn")
