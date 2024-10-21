extends Resource
class_name InventoryData

@export var slots: Array[SlotData]

func addItemToSlot(selectedSlot: int, item: PickupData):
	if not hasItemInSlot(selectedSlot):
		var slot: SlotData = SlotData.new()
		slot.item = item
		slot.quantity = 1
		slots[selectedSlot] = slot
		return
	
	slots[selectedSlot].quantity += 1

func removeItemFromSlot(selectedSlot: int):
	slots[selectedSlot].quantity -= 1
	if slots[selectedSlot].quantity <= 0:
		slots[selectedSlot] = null

func getItemInSlot(selectedSlot: int):
	if slots[selectedSlot] != null && slots[selectedSlot].item != null:
		return slots[selectedSlot].item as PickupData
	else:
		return null

func hasItemInSlot(selectedSlot: int) -> bool:
	return slots[selectedSlot] != null
