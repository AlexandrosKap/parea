extends Control

const PareaUI := preload("res://src/libs/parea/frontend/PareaUI.gd")

var sets := ["level1/bob", "level1/hello", "level2/greenName", "level2/redName"]
onready var ui: PareaUI = $PareaUI

func _ready() -> void:
	randomize()
	ui.move_textbox_mid()
	ui.load_language("res://configs/dialogue/en.fcsv")
	ui.play_random(sets)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var err := get_tree().reload_current_scene()
		if err:
			assert(false, "Can not reload scene.")
