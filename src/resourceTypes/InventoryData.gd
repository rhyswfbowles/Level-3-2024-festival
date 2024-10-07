extends Resource
class_name InventoryData

@export var slots: Array[SlotData]

func add_item(selectedSlot: int, item: PickupData):
	if not has_item(selectedSlot):
		var slot = SlotData.new()
		slot.item = item
		slot.quantity = 1
		slots[selectedSlot] = slot
		return
	
	slots[selectedSlot].quantity += 1

func remove_item(selectedSlot: int):
	slots[selectedSlot].quantity -= 1
	if slots[selectedSlot].quantity <= 0:
		slots[selectedSlot].item = null

func get_item(selectedSlot: int) -> PickupData:
	return slots[selectedSlot].item

func has_item(selectedSlot: int) -> bool:
	return slots[selectedSlot] != null