extends Area2D

export var obstacles_limit : Vector2 = Vector2(50,130)
onready var obstacles = $obstacles

func move_obstacles():
	obstacles.position.y = randi()%int(obstacles_limit.y - obstacles_limit.x) + obstacles_limit.x

func show_obstacles(show:bool):
	$obstacles/obstacle.set_visible(show)
	$obstacles/obstacle2.set_visible(show) 
	$obstacles/score_hitbox.monitoring=show


func _on_sol_body_entered(body):
	if body.is_in_group("player"):
		Events.emit_signal("player_hit_obstacles")

func activate_coins():
	$coin.active_coin()
	var x=rand_range($coin_top_left.position.x,$coin_bottom_right.position.x)
	var y=rand_range($coin_top_left.position.y,$coin_bottom_right.position.y)
	$coin.position=Vector2(x,y)
	
func hide_coins():
	$coin.hide()


func _on_score_hitbox_body_entered(body):
	if body.is_in_group("player"):
		Events.emit_signal("player_pass_obstacles")
