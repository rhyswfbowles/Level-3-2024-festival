extends Node

class_name Items

var Item = preload("res://scripts/items/Item.gd")

var items = {};

func _init():
	items[ItemsList.WATERBALLOON] = Item.new("Waterballoon", preload("res://models/waterballoon.blend"), true, 10, "A water balloon filled with water... we think")
	

func getItem(itemName: String) -> Item:
	if not items.has(itemName):
		return null
	return items.get(itemName)
