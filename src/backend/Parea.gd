extends Reference

enum {NAME, NUMBER, SCENE, TEXT}

var dialogue_lines := {}

func load_dialogue_lines(path: String) -> void:
	for line in preload("./Utils.gd").read_csv(path):
		dialogue_lines[line[0]] = [
			line[1], line[2], line[3], line[4]
		]

func get_line(code: String) -> String:
	return dialogue_lines[code]

func get_lines(codes: Array) -> Array:
	var result := []
	for code in codes:
		result.append(get_line(code))
	return result
