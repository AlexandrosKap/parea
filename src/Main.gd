extends Control

var sets := ["level1/bob", "level1/hello", "level2/greenName", "level2/redName"]
onready var ui := $PareaUI

func _ready() -> void:
	randomize()
	ui.play_random(sets)
