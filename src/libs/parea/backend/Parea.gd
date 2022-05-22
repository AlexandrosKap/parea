extends Reference

const Utils := preload("res://src/libs/utils/Utils.gd")

enum {
	EMOTION, EVENT,
	NAME, NUMBER,
	PAUSE_END, PAUSE_START,
	SCENE, SET, SOUND,
	TEXT
}

var database := {}

func load_language(path: String) -> void:
	database.clear()
	var csv := Utils.read_csv(path)
	for line in csv:
		database[line[0]] = []
		var is_first := true
		for value in line:
			if is_first:
				is_first = false
			else:
				database[line[0]].append(value)
	assert(len(csv), "Failed to load language.")

func has_set(set: String) -> bool:
	return database.get(set + "0") != null

func get_line(code: String) -> Array:
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

func get_random_line(set: String) -> Array:
	var lines := get_lines(set)
	return lines[randi() % len(lines)]

func get_random_lines(sets: Array) -> Array:
	for set in sets:
		assert(has_set(set), "Set does not exist.")
	return get_lines(sets[randi() % len(sets)])

func get_emotion(line: Array) -> String:
	return line[EMOTION]

func get_name(line: Array) -> String:
	return line[NAME]

func get_number(line: Array) -> String:
	return line[NUMBER]

func get_pause_end(line: Array) -> String:
	return line[PAUSE_END]

func get_pause_start(line: Array) -> String:
	return line[PAUSE_START]

func get_scene(line: Array) -> String:
	return line[SCENE]

func get_set(line: Array) -> String:
	return line[SET]

func get_sound(line: Array) -> String:
	return line[SOUND]

func get_text(line: Array) -> String:
	return line[TEXT]
