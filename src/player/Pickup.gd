extends Node

@onready var toolbarContainer: Control = $"../HUD/MarginContainer/ToolbarContainer"

func on_item_picked_up(item: ItemData):
	toolbarContainer.addItemToInventory(item)
