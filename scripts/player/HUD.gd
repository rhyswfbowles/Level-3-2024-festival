extends Control

var allSlots = ["Slot1", "Slot2", "Slot3", "Slot4", "Slot5", "Slot6", "Slot7", "Slot8", "Slot9"];

var fakeToolbar = {
	"Slot1": {
		"itemName": "The invisible item",
	},
	"Slot2": {
		"itemName": "A fake item",
	},
	"Slot3": {
		"itemName": "A silent fart",
	},
	"Slot4": {
		"itemName": "Literally nothing",
	},
	"Slot5": {
		"itemName": "Me when im not there",
	},
	"Slot6": {
		"itemName": "Space",
	},
	"Slot7": {
		"itemName": "What could have been",
	},
	"Slot8": {
		"itemName": "The sword of no mesh",
	},
	"Slot9": {
		"itemName": "Whoops, I left the item at home",
	}
}

func setFakeToolbarItem(itemName):
	get_node("MarginContainer/CenterContainer/ItemName").text = itemName;

func setActiveSlot(slotName):
	for slot in allSlots:
		if slot == slotName:
			get_node("MarginContainer/HBoxContainer/ToolbarContainer/" + slot + "/TextureRect").texture = load("res://assets/static/player/hud/HUD_selected_toolbar.png");
			setFakeToolbarItem(fakeToolbar[slot]["itemName"]);
		else:
			get_node("MarginContainer/HBoxContainer/ToolbarContainer/" + slot + "/TextureRect").texture = load("res://assets/static/player/hud/HUD_unselected_toolbar.png");

func _ready():
	setActiveSlot("Slot1");

func _process(_delta):
	if Input.is_action_pressed("SelectInventorySlot1"):
		setActiveSlot("Slot1");
	elif Input.is_action_pressed("SelectInventorySlot2"):
		setActiveSlot("Slot2");
	elif Input.is_action_pressed("SelectInventorySlot3"):
		setActiveSlot("Slot3");
	elif Input.is_action_pressed("SelectInventorySlot4"):
		setActiveSlot("Slot4");
	elif Input.is_action_pressed("SelectInventorySlot5"):
		setActiveSlot("Slot5");
	elif Input.is_action_pressed("SelectInventorySlot6"):
		setActiveSlot("Slot6");
	elif Input.is_action_pressed("SelectInventorySlot7"):
		setActiveSlot("Slot7");
	elif Input.is_action_pressed("SelectInventorySlot8"):
		setActiveSlot("Slot8");
	elif Input.is_action_pressed("SelectInventorySlot9"):
		setActiveSlot("Slot9");
