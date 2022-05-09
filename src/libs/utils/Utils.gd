extends Reference

# An empty dictionary is returned if the path or file is invalid.
static func read_json(path: String) -> Dictionary:
	var result := {}
	var file := File.new()
	var err := file.open(path, File.READ)
	if err:
		assert(false, "Can not open file.")
	else:
		var json := JSON.parse(file.get_as_text())
		if json.error:
			assert(false, "Can not parse file.")
		else:
			result = json.result
		file.close()
	return result

# An empty array is returned if the path or file is invalid.
static func read_csv(path: String) -> Array:
	var result := []
	var file := File.new()
	var err := file.open(path, File.READ)
	if err:
		assert(false, "Can not open file.")
	else:
		while not file.eof_reached():
			var csv_line := file.get_csv_line()
			if len(csv_line) != 1: # Bruh...
				result.append(csv_line)
		file.close()
	return result
