extends Control

enum {NAME, NUMBER, SCENE, TEXT}

var parea = preload("../backend/Parea.gd").new()
export(String, FILE, "*.fcsv") var path := ""
onready var text_box := $PareaTextBox

func _ready() -> void:
	parea.load_language(path)

func play(set: String) -> void:
	var lines: Array = parea.get_lines(set)
	for line in lines:
		text_box.add_text(
			parea.get_name(line) \
			+ ": "
			+ parea.get_text(line) \
			+ "\n\n"
		)

func play_random(sets: Array) -> void:
	play(parea.get_random_set(sets))
