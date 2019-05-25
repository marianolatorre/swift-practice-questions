/* compare binary trees are same value
 */

class Node<T: Equatable> : Equatable {
    var x: Node?
    var y: Node?
    var value: T

    init(value: T) {
        self.value = value
    }

    // recoursive equatable in-order traversing implementation
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.x == rhs.x &&
            lhs.value == rhs.value &&
            lhs.y == rhs.y
    }
}

// tree 123
var treeA = Node(value: 1)
var treeAx = Node(value: 2)
var treeAy = Node(value: 3)
treeA.x = treeAx
treeA.y = treeAy

// tree 123
var treeB = Node(value: 1)
var treeBx = Node(value: 2)
var treeBy = Node(value: 3)
treeB.x = treeBx
treeB.y = treeBy

// tree 456
var treeC = Node(value: 4)
var treeCx = Node(value: 5)
var treeCy = Node(value: 6)
treeC.x = treeCx
treeC.y = treeCy

print(treeA == treeB) // true
print(treeB == treeC) // false
print(treeA == treeC) // false
