extends Node

@onready var inventory = $"../HUD"

func on_item_picked_up(item: Item):
	print("Item picked up: " + item.name)
	inventory.addItemToToolbar(item)
	
