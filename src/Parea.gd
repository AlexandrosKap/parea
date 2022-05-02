extends Control

func print_dialogue_line(line: Dictionary):
	print(
		"(%s) (%s)\n\"%s\"\n" %
		[line["category"], line["name"], line["text"]]
	)

func read_json(path: String) -> Dictionary:
	var result := {}
	var file := File.new()
	var err := file.open(path, File.READ)
	if err:
		assert(false, "Can't open file.")
	else:
		var json := JSON.parse(file.get_as_text())
		if json.error:
			assert(false, "Can't parse file.")
		else:
			result = json.result
		file.close()
	return result

func show_menu():
	pass

func hide_menu():
	pass

func show_textbox():
	pass

func hide_textbox():
	pass

func show_dialogue(dialogue: Array) -> void:
	for line in dialogue:
		print_dialogue_line(line)
		$PareaTextBox/Panel/Margin/Label.append_bbcode(line["text"] + "\n")

func hide_dialogue():
	pass
