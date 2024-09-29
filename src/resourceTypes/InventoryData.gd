extends Resource
class_name InventoryData

@export var slots: Array[ItemData]

func add_item(selectedSlot: int, item: ItemData):
	print("Adding item to slot: " + str(selectedSlot))
	slots[selectedSlot] = item

func remove_item(selectedSlot: int):
	slots[selectedSlot] = null

func get_item(selectedSlot: int) -> ItemData:
	return slots[selectedSlot]

func has_item(selectedSlot: int) -> bool:
	return slots[selectedSlot] != null