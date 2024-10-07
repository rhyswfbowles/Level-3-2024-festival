extends Node

@onready var toolbarContainer: Control = $"../HUD/MarginContainer/ToolbarContainer"

func on_item_picked_up(item: PickupData):
	toolbarContainer.addItemToInventory(item)
