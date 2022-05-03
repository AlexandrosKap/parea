extends Reference

# Read a json file.
# An empty dictionary is returned if the path or file is invalid.
static func read_json(path: String) -> Dictionary:
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
