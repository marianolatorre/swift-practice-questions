/*
Printed linked list values
 */

class Node<T> {
    var value: T
    var next: Node?

    init(value: T) {
        self.value = value
    }
}

var linkedList = Node(value: 1)
var linkedListA = Node(value: 2)
var linkedListB = Node(value: 3)
var linkedListC = Node(value: 4)

linkedList.next = linkedListA
linkedListA.next = linkedListB
linkedListB.next = linkedListC

func printList(_ root: Node<Int>) -> String {

    var result = String(root.value)
    if let next = root.next {
        result.append(contentsOf: ", ")
        result.append(contentsOf: printList(next))
    }

    return result
}

print(printList(linkedList)) // 1, 2, 3, 4
