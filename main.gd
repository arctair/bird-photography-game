extends Node2D


var treeScene = preload('res://Tree.tscn')
var bluejayScene = preload('res://Bluejay.tscn')

func randomPosition(sprite):
	var viewportSize = get_viewport().size
	var spriteSize = sprite.texture.get_size() * sprite.scale / 2
	return Vector2(
		rand_range(spriteSize.x, viewportSize.x - spriteSize.x),
		rand_range(spriteSize.y, viewportSize.y - spriteSize.y)
	)

func _ready():
	for _n in range(16):
		var treeInstance = treeScene.instance()
		treeInstance.position = randomPosition(treeInstance)
		treeInstance.z_index = treeInstance.position.y
		add_child(treeInstance)
	for _n in range(4):
		var birdInstance = bluejayScene.instance()
		add_child(birdInstance)
