extends Control

enum {NAME, NUMBER, SCENE, TEXT}

var parea = preload("../backend/Parea.gd").new()
export(String, FILE, "*.fcsv") var path := ""
onready var text_box := $PareaTextBox

func _ready():
	parea.load_language(path)

func play(set: String) -> void:
	var lines: Array = parea.get_lines(set)
	for line in lines:
		text_box.add_text(
			parea.get_name(line) \
			+ ":\n\t"
			+ parea.get_text(line) \
			+ "\n"
		)
