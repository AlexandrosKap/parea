extends Control

enum {NAME, NUMBER, SCENE, TEXT}

onready var text_box := $PareaTextBox

func show_menu() -> void:
	pass

func hide_menu() -> void:
	pass

func show_dialogue(lines: Array) -> void:
	for line in lines:
		text_box.add_text(line[TEXT] + "\n")

func hide_dialogue() -> void:
	pass
