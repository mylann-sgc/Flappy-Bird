extends Node

enum State{
	menu,play,dead
}

var state = State.menu

signal state_changed (s)

func change_state (s) :
	state = s 
	emit_signal("state_changed", s)
