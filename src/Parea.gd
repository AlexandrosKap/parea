extends Control

onready var text_box := $PareaTextBox

func print_dialogue_line(line: Dictionary) -> void:
	print(
		"(%s) (%s)\n\"%s\"\n" %
		[line["category"], line["name"], line["text"]]
	)

func show_menu() -> void:
	pass

func hide_menu() -> void:
	pass

func show_dialogue(dialogue: Array) -> void:
	for line in dialogue:
		print_dialogue_line(line)
		text_box.add_text(line["text"] + "\n")

func hide_dialogue() -> void:
	pass
