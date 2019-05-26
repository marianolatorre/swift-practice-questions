/*

 Find lowest common ancestor (LCA) in a binary search tree (BST).

 */

import Foundation

class Node: CustomStringConvertible {

    var value: Int
    var x: Node?
    var y: Node?

    init(_ value: Int){
        self.value = value
    }

    var description: String {
        return String(value)
    }
}

var tree = Node(10)

tree.x = Node(2)
tree.y = Node(12)
tree.x?.x = Node(1)
tree.x?.y = Node(3)
tree.y?.y = Node(13)
tree.y?.x = Node(11)


/*
 10  -> 12-> 13
 -> 11
 -> 2 -> 3
 -> 1
 */

class BST {
    var root: Node?

    func lowestCommonAncestor(node: Node?, valueA: Int, valueB: Int ) -> Node? {
        guard let node = node else {
            return nil
        }

        if node.value > valueA && node.value > valueB {
            return lowestCommonAncestor(node: node.x, valueA: valueA, valueB: valueB)
        }
        else if node.value < valueA && node.value < valueB {
            return lowestCommonAncestor(node: node.y, valueA: valueA, valueB: valueB)
        }

        return node
    }
}


let bstTree = BST()
bstTree.root = tree


func test(_ a: Int, _ b: Int) {
    let lowest = bstTree.lowestCommonAncestor(node: bstTree.root,valueA: a,valueB: b)

    if let lowest = lowest {
        print("lowestCommonAncestor of \(a) & \(b) => \(lowest)")
    }
}


test(11,13)
test(3,13)
test(1,3)
test(2,3)
