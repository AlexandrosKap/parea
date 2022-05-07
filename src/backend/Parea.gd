extends Reference

enum {NAME, NUMBER, SCENE, TEXT}

var database := {}

func load_language(path: String) -> void:
	database.clear()
	for line in preload("./Utils.gd").read_csv(path):
		database[line[0]] = [
			line[1], line[2], line[3], line[4]
		]
	assert(len(database), "Failed to load language.")

func get_line(code: String) -> String:
	return database[code]

func get_lines(set: String) -> Array:
	var result := []
	var number := 0
	var code := set + str(number)
	while database.get(code):
		result.append(get_line(code))
		number += 1
		code = set + str(number)
	assert(len(result), "Result is empty.")
	return result
