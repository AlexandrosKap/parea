extends Control

var sets := ["level1/bob", "level1/hello", "level2/greenName", "level2/redName"]
onready var ui := $PareaUI

func _ready() -> void:
	randomize()
	ui.play_random(sets)

func _input(event) -> void:
	if event.is_action_pressed("ui_accept"):
		ui.play_random(sets)
