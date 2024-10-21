extends Pickup

func _ready():
    super._ready()
    if data:
        print("Waterballoon pickup: %s, Cost: %s" % [data.name, data.cost])