extends CanvasLayer
var State = preload("res://Scripts/states.gd").State

func _ready():
	States.connect("state_changed",self,"on_state_changed")
	
func on_state_changed(s):
	if s==State.menu:
		$MarginContainer/menu.visible=true
	else :
		$MarginContainer/menu.visible=false
		
	if s==State.dead:
		$MarginContainer/dead.visible=true
	else :
		$MarginContainer/dead.visible=false
		
	if s==State.play:
		$MarginContainer/game.visible=true
	else :
		$MarginContainer/game.visible=false
