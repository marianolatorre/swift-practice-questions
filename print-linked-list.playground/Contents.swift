/*
Printed linked list values
 */

class Node<T>: Equatable {


    var value: T
    var next: Node?

    init(value: T) {
        self.value = value
    }

    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
    }
}

var linkedList = Node(value: 1)
var linkedListA = Node(value: 2)
var linkedListB = Node(value: 3)
var linkedListC = Node(value: 4)

linkedList.next = linkedListA
linkedListA.next = linkedListB
linkedListB.next = linkedListC
linkedListC.next = linkedListA

var visited: [Node<Int>] = [Node<Int>]()

func printList(_ root: Node<Int>) -> String {

    var result = String(root.value)
    
    // cache visited items
    visited.append(root)

    if let next = root.next {
        // Let's avoid printing infinite loops in the linked list!
        if visited.contains(next) == false {
            result.append(contentsOf: ", ")
            result.append(contentsOf: printList(next))
        }
    }

    return result
}

print(printList(linkedList)) // 1, 2, 3, 4
