class_name Inventory
extends Control

const TOOLBAR_SLOTS = { Slot1 = "Slot1", Slot2 = "Slot2", Slot3 = "Slot3", Slot4 = "Slot4", Slot5 = "Slot5", Slot6 = "Slot6", Slot7 = "Slot7", Slot8 = "Slot8", Slot9 = "Slot9"}

var toolbar: Dictionary = {}
var activeSlot = null
var isDropping = false
@onready var player = $".."

func setActiveSlot(slotName: String):
	activeSlot = slotName
	for slot in toolbar:
		if slot == slotName:
			get_node("MarginContainer/HBoxContainer/ToolbarContainer/"+ slot +"/Background").texture = load("res://assets/static/player/hud/HUD_selected_toolbar.png");
			if toolbar[slot] != null:
				print(toolbar[slot])
				get_node("MarginContainer/CenterContainer/ItemName").text = toolbar[slot].name;
			else:
				get_node("MarginContainer/CenterContainer/ItemName").text = "";
		else:
			get_node("MarginContainer/HBoxContainer/ToolbarContainer/"+ slot +"/Background").texture = load("res://assets/static/player/hud/HUD_unselected_toolbar.png");

func addItemToToolbar(item: Item):
	var currentSlot = activeSlot
	toolbar[currentSlot] = item;
	get_node("MarginContainer/HBoxContainer/ToolbarContainer/"+ currentSlot +"/ItemImage").texture = load(item.image.resource_path);
	setActiveSlot(currentSlot)

func dropItemFromToolbar(item: Item):
	var currentSlot = activeSlot
	if toolbar[currentSlot] == null:
		return
		
	isDropping = true
	toolbar[currentSlot] = null;
	get_node("MarginContainer/HBoxContainer/ToolbarContainer/"+ currentSlot +"/ItemImage").texture = null;
	var instance = item.model.instantiate()
	instance.position = player.position
	player.add_sibling(instance)
	isDropping = false

func initToolbar():
	for key in TOOLBAR_SLOTS.values():
		toolbar[key] = null;

func _ready():
	initToolbar()
	setActiveSlot(TOOLBAR_SLOTS.Slot1);

func _process(_delta):
	if activeSlot == null:
		activeSlot = TOOLBAR_SLOTS.Slot1
	if Input.is_action_pressed("drop_item"):
		dropItemFromToolbar(toolbar[activeSlot])
		
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
