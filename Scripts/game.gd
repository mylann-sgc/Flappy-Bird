extends Node2D
var State = preload("res://Scripts/states.gd").State

onready var ground = $sol
onready var ground2 = $sol2

export var defilement = 70
export var horizontal_size = 144

var left_ground 
var right_ground

var score

func _ready():
	score=0
	left_ground = ground
	right_ground = ground2
	left_ground.show_obstacles(false)
	left_ground.hide_coins()
	right_ground.move_obstacles()
	right_ground.activate_coins()
	
	Events.connect("player_hit_obstacles", self, "_on_player_hit_obstacles")
	Events.connect("player_hit_coin", self, "_on_player_hit_coin")
	Events.connect("player_pass_obstacles", self, "_on_player_pass_obstacles")
	
	States.connect("state_changed", self, "_on_state_changed")

func _process(delta):
	if States.state==State.play:
		left_ground.global_position.x -= defilement*delta
		right_ground.global_position.x -= defilement*delta
		
		if left_ground.global_position.x + horizontal_size < 0 :
			var tmp = left_ground
			left_ground = right_ground
			right_ground = tmp
			
			right_ground.global_position.x = left_ground.global_position.x + horizontal_size
			
			right_ground.move_obstacles()
			right_ground.show_obstacles(true)
			right_ground.activate_coins()

func _on_player_hit_obstacles() :
	States.change_state(State.dead)
	$player.die()
	
func _on_player_hit_coin():
	score +=5
	Events.emit_signal("score_changed", score)
	
func _on_player_pass_obstacles():
	score +=1
	Events.emit_signal("score_changed", score)

func _on_state_changed(s):
	if s==State.play:
		$player.fly()

