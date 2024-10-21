class_name InventoryManager
extends Control

var actions: Actions = Actions.new()

#region Signals

signal sItemAdded(slot_index: int, item: PickupData)
signal sItemRemoved(slot_index: int)
signal sAddItemToInventory(item: PickupData)

func sfOnItemAdded(slot_index: int, item: PickupData) -> void:
	toolbarItems[slot_index].get_node("ItemImage").texture = load(item.image.resource_path)
	toolbarItemName.text = item.name

func sfOnItemRemoved(slot_index: int) -> void:
	toolbarItems[slot_index].get_node("ItemImage").texture = null
	toolbarItemName.text = ""
	inventory.removeItemFromSlot(slot_index)

func sfOnAddItemToInventory(item: PickupData) -> void:
	addItemToInventory(item)

#endregion Signals

var activeInventorySlot: int = 0

@onready var inventory: Resource = load("res://resources/player/player_inventory.tres")
@onready var selectedSlotStyle: StyleBoxFlat = preload("res://resources/player/HUD/inventory_slot_selected.tres")
@onready var unselectedSlotStyle: StyleBoxFlat = preload("res://resources/player/HUD/inventory_slot_unselected.tres")

@onready var toolbarItems: Array[Node] = get_node("Toolbar").get_children()
@onready var toolbarItemName: Label = get_node("ItemName")

func _ready() -> void:
	setActiveInventorySlot(0)
	sItemAdded.connect(sfOnItemAdded)
	sItemRemoved.connect(sfOnItemRemoved)
	sAddItemToInventory.connect(sfOnAddItemToInventory)

func _process(delta) -> void:
	for i in range(10):
		if Input.is_action_pressed("SelectInventorySlot" + str(i + 1)):
			setActiveInventorySlot(i)
			
	if Input.is_action_pressed("primary_fire"):
		if doesCurrentSlotHaveItem():
			actions.increaseThrowPower(delta)

	if Input.is_action_just_released("primary_fire"):
		removeItemFromInventory()
	

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("scroll_inventory_positive"):
		setActiveInventorySlot(activeInventorySlot + 1)

	if Input.is_action_pressed("scroll_inventory_negative"):
		setActiveInventorySlot(activeInventorySlot - 1)

#region Functions
func doesCurrentSlotHaveItem() -> bool:
	return inventory.hasItemInSlot(activeInventorySlot)

func findNextEmptySlot() -> int:
	for slot in toolbarItems:
		var slotIndex: int = slot.get_name().to_int()
		if not inventory.hasItemInSlot(slotIndex):
			return slotIndex
	return -1

func setActiveInventorySlot(slotIndex: int) -> void:
	if slotIndex < 0:
		slotIndex = 0
	elif slotIndex > 9:
		slotIndex = 9

	activeInventorySlot = slotIndex
	for slot: Panel in toolbarItems:
		if slot.get_name() == str(slotIndex):
			slot.add_theme_stylebox_override("panel", selectedSlotStyle)
			if inventory.hasItemInSlot(slotIndex):
				slot.get_node("ItemImage").texture = load(inventory.getItemInSlot(slotIndex).image.resource_path)
				toolbarItemName.text = inventory.slots[slotIndex].item.name
			else:
				toolbarItemName.text = ""
		else:
			slot.add_theme_stylebox_override("panel", unselectedSlotStyle)

func addItemToInventory(item: PickupData) -> void:
	var targetSlot: int = activeInventorySlot
	if inventory.hasItemInSlot(targetSlot):
		targetSlot = findNextEmptySlot()

	inventory.addItemToSlot(targetSlot, item)
	sItemAdded.emit(targetSlot, item)

func removeItemFromInventory() -> void:
	var currentSlot: int = activeInventorySlot
	var item: PickupData = inventory.getItemInSlot(currentSlot)
	
	if item == null:
		actions.resetThrowPower()
		return

	var pickup_scene: PackedScene = PickupItemsIndex.getPickupScene(item.name)
	if pickup_scene == null:
		push_error("Pickup scene not found for item: %s" % item.name)
		return

	actions.throwItem(pickup_scene)
	sItemRemoved.emit(currentSlot)

#endregion Functions
