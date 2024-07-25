extends Control

const TOOLBAR_SLOTS = {Slot1 = "Slot1", Slot2 = "Slot2", Slot3 = "Slot3", Slot4 = "Slot4", Slot5 = "Slot5", Slot6 = "Slot6", Slot7 = "Slot7", Slot8 = "Slot8", Slot9 = "Slot9"}

var toolbar: Dictionary = {}

var Item = preload ("res://scripts/items/Item.gd")
var Items = preload ("res://scripts/items/Items.gd").new()

func setToolbarActiveItem(slotName: String):
	if toolbar[slotName] == null:
		get_node("MarginContainer/CenterContainer/ItemName").text = "";
		return
		
	var item = Items.getItem(toolbar[slotName]);
	if item != null:
		get_node("MarginContainer/CenterContainer/ItemName").text = item.getName();
	else:
		get_node("MarginContainer/CenterContainer/ItemName").text = "";

	

func setActiveSlot(slotName: String):
	for slot in toolbar:
		if slot == slotName:
			get_node("MarginContainer/HBoxContainer/ToolbarContainer/"+ slot +"/Background").texture = load("res://assets/static/player/hud/HUD_selected_toolbar.png");
			setToolbarActiveItem(slotName);
		else:
			get_node("MarginContainer/HBoxContainer/ToolbarContainer/"+ slot +"/Background").texture = load("res://assets/static/player/hud/HUD_unselected_toolbar.png");

func initToolbar():
	for key in TOOLBAR_SLOTS.values():
		toolbar[key] = null;

func addItemToToolbar(toolbarSlot: String, itemId: String):
	var item = Items.getItem(itemId);
	toolbar[toolbarSlot] = itemId;
	get_node("MarginContainer/HBoxContainer/ToolbarContainer/"+ toolbarSlot +"/ItemImage").texture = load("res://assets/static/items/waterballoon.png");

func _ready():
	initToolbar()
	addItemToToolbar(TOOLBAR_SLOTS.Slot1, ItemsList.WATERBALLOON);
	setActiveSlot(TOOLBAR_SLOTS.Slot1);

func _process(_delta):
	if Input.is_action_pressed("SelectInventorySlot1"):
		setActiveSlot(TOOLBAR_SLOTS.Slot1);
	elif Input.is_action_pressed("SelectInventorySlot2"):
		setActiveSlot(TOOLBAR_SLOTS.Slot2);
	elif Input.is_action_pressed("SelectInventorySlot3"):
		setActiveSlot(TOOLBAR_SLOTS.Slot3);
	elif Input.is_action_pressed("SelectInventorySlot4"):
		setActiveSlot(TOOLBAR_SLOTS.Slot4);
	elif Input.is_action_pressed("SelectInventorySlot5"):
		setActiveSlot(TOOLBAR_SLOTS.Slot5);
	elif Input.is_action_pressed("SelectInventorySlot6"):
		setActiveSlot(TOOLBAR_SLOTS.Slot6);
	elif Input.is_action_pressed("SelectInventorySlot7"):
		setActiveSlot(TOOLBAR_SLOTS.Slot7);
	elif Input.is_action_pressed("SelectInventorySlot8"):
		setActiveSlot(TOOLBAR_SLOTS.Slot8);
	elif Input.is_action_pressed("SelectInventorySlot9"):
		setActiveSlot(TOOLBAR_SLOTS.Slot9);
