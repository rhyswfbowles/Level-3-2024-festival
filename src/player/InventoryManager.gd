class_name InventoryManager
extends Control

var activeInventorySlot = 0

@onready var inventory = load("res://resources/player/player_inventory.tres")
@onready var world = $"."

@onready var toolbarItems = get_node("Toolbar").get_children()
@onready var toolbarItemName = get_node("ItemName")

func setActiveInventorySlot(slotIndex: int) -> void:
	activeInventorySlot = slotIndex
	for slot in toolbarItems:
		if slot.get_name() == str(slotIndex):
			if inventory.has_item(slotIndex):
				slot.get_node("ItemImage").texture = load(inventory.get_item(slotIndex).image.resource_path);
				toolbarItemName.text = inventory.slots[slotIndex].name;
			else:
				slot.get_node("Background").texture = load("res://assets/static/player/hud/HUD_selected_toolbar.png");
				toolbarItemName.text = "";
		else:
			slot.get_node("Background").texture = load("res://assets/static/player/hud/HUD_unselected_toolbar.png");


func addItemToInventory(item: ItemData) -> void:
	var targetSlot = activeInventorySlot
	inventory.add_item(targetSlot, item);
	toolbarItems[targetSlot].get_node("ItemImage").texture = load(inventory.get_item(targetSlot).image.resource_path);
	toolbarItemName.text = inventory.slots[targetSlot].name;


func dropItemFromInventory() -> void:
	var currentSlot = activeInventorySlot

	if !inventory.has_item(currentSlot):
		return

	var item = inventory.get_item(currentSlot);

	if item == null or item.prefab == null:
		return

	var instance = item.prefab.instantiate()
	world.add_child(instance)
	
	inventory.remove_item(currentSlot)
	toolbarItems[currentSlot].get_node("ItemImage").texture = null;
	toolbarItemName.text = "";


func _ready() -> void:
	setActiveInventorySlot(0);

func _process(_delta) -> void:
	if Input.is_action_pressed("drop_item"):
		dropItemFromInventory()

	if Input.is_action_pressed("SelectInventorySlot1"):
		setActiveInventorySlot(0);
	elif Input.is_action_pressed("SelectInventorySlot2"):
		setActiveInventorySlot(1);
	elif Input.is_action_pressed("SelectInventorySlot3"):
		setActiveInventorySlot(2);
	elif Input.is_action_pressed("SelectInventorySlot4"):
		setActiveInventorySlot(3);
	elif Input.is_action_pressed("SelectInventorySlot5"):
		setActiveInventorySlot(4);
	elif Input.is_action_pressed("SelectInventorySlot6"):
		setActiveInventorySlot(5);
	elif Input.is_action_pressed("SelectInventorySlot7"):
		setActiveInventorySlot(6);
	elif Input.is_action_pressed("SelectInventorySlot8"):
		setActiveInventorySlot(7);
	elif Input.is_action_pressed("SelectInventorySlot9"):
		setActiveInventorySlot(8);
	elif Input.is_action_pressed("SelectInventorySlot10"):
		setActiveInventorySlot(9);
