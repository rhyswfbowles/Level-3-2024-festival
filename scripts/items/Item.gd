extends Object

class_name Item

# Declare the properties
var name: String
var model: String
var image: String
var is_stackable: bool
var max_stack_size: int
var description: String

# Initialize the properties
func _init(name: String, model: String, image: String, is_stackable: bool, max_stack_size: int, description: String):
	self.name = name
	self.model = model
	self.is_stackable = is_stackable
	self.max_stack_size = max_stack_size
	self.description = description

# Getter methods
func getName() -> String:
	return self.name

func getModel() -> String:
	return self.model
	
func getImage() -> String:
	return self.image

func getIsStackable() -> bool:
	return self.is_stackable

func getMaxStackSize() -> int:
	return self.max_stack_size

func getDescription() -> String:
	return self.description
