extends Control

const DialoguePlayer := preload("res://src/libs/parea/frontend/DialoguePlayer.gd")

var sets := ["level1/bob", "level1/hello", "level2/greenName", "level2/theory"]
onready var ui: DialoguePlayer = $DialoguePlayer

func _ready() -> void:
	ui.move_textbox_mid()
	ui.load_language("res://configs/dialogue/en.fcsv")
	ui.play_lines(sets[1])
	var err := ui.connect("ended", self, "_on_DialoguePlayer_ended")
	assert(err == 0)

func _on_DialoguePlayer_ended() -> void:
	ui.play_lines(sets[1])
