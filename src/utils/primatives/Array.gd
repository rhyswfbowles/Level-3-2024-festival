extends Node
class_name ArrayUtil

func shuffle(array: Array) -> Array:
	randomize()
	array.shuffle()
	return array

func getRandomElement(array: Array) -> Variant:
	return array[randi() % array.size()]