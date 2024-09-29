extends Node3D

var item: ItemData

func _ready():
	var resource = load("res://resources/pickups/{name}/{name}.tres".format({ "name": get_node(".").name.to_lower()}))
	item = resource

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.get_node("CollisionShape3D") && body.get_node("CollisionShape3D").has_method("on_item_picked_up") && item.pickable:
		body.get_node("CollisionShape3D").on_item_picked_up(item)
		queue_free()
