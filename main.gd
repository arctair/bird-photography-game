extends Node2D


var treeScene = preload('res://Tree.tscn')
var bluejayScene = preload('res://Bluejay.tscn')

func _ready():
	randomize()
	var size = get_viewport().size
	for n in range(16):
		var treeInstance = treeScene.instance()
		var treeSize = treeInstance.texture.get_size() * treeInstance.scale / 2
		treeInstance.position = Vector2(
			rand_range(treeSize.x, size.x - treeSize.x),
			rand_range(treeSize.y, size.y - treeSize.y)
		)
		treeInstance.z_index = treeInstance.position.y
		add_child(treeInstance)
	for n in range(4):
		var birdInstance = bluejayScene.instance()
		var birdSize = birdInstance.texture.get_size() * birdInstance.scale / 2
		birdInstance.position = Vector2(
			rand_range(birdSize.x, size.x - birdSize.x),
			rand_range(birdSize.y, size.y - birdSize.y)
		)
		birdInstance.flip_h = randf() > 0.5
		add_child(birdInstance)
