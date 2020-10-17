extends Node2D


var treeScene = preload('res://Tree.tscn')

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
