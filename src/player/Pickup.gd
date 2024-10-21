extends Node

func onItemPickedUp(item: PickupData):
	Globals.inventory.sAddItemToInventory.emit(item)
