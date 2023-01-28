extends Control

func _ready():
	Events.connect("score_changed", self, "_on_score_changed")

func _on_score_changed(score):
	$VBoxContainer/score.text = str(score)
