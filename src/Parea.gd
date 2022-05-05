extends Control

onready var text_box := $PareaTextBox

func show_menu() -> void:
	pass

func hide_menu() -> void:
	pass

func show_dialogue(dialogue_lines: Array) -> void:
	var is_first = true
	for dialogue_line in dialogue_lines:
		if not is_first:
			text_box.add_text(dialogue_line[4] + "\n")
		else:
			is_first = false

func hide_dialogue() -> void:
	pass
