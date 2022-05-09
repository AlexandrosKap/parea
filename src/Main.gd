extends Control

const PareaUI := preload("res://src/libs/parea/frontend/PareaUI.gd")

var sets := ["level1/bob", "level1/hello", "level2/greenName", "level2/theory"]
onready var ui: PareaUI = $PareaUI

func _ready() -> void:
	randomize()
	ui.move_textbox_mid()
	ui.load_language("res://configs/dialogue/en.fcsv")
	ui.play_line(sets[3] + "5")

func _input(event: InputEvent) -> void:
	if not ui.is_playing() and event.is_action_pressed("ui_accept"):
		ui.play_random_line(sets[3])
