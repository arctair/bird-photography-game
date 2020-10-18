extends Node2D


const treeScene := preload('res://Tree.tscn')
const trees := []

func _ready():
	for _n in range(16):
		var tree = treeScene.instance()
		tree.position = randomPosition(tree)
		trees.append(tree)
	trees.sort_custom(PositionYSorter, 'compareByPositionY')
	for tree in trees:
		add_child(tree)

func randomPosition(sprite):
	var viewportSize = get_viewport().size
	var spriteSize = sprite.texture.get_size() * sprite.scale / 2
	return Vector2(
		rand_range(spriteSize.x, viewportSize.x - spriteSize.x),
		rand_range(spriteSize.y, viewportSize.y - spriteSize.y)
	)

func randomTreePosition(sprite):
	return trees[randi() % trees.size()].position

class PositionYSorter:
	static func compareByPositionY(s1, s2):
		return s1.position.y < s2.position.y
