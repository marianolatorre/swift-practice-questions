/*
 Write dequeueReusableCell method for UITableView
 */

import UIKit

class UITableView {
    
    private lazy var queueHash = [String: Queue<UITableViewCell>]()
    
    // Dequeues cell by cell identifier
    func dequeueReusableCell(withIdentifier identifier: String,
                             for indexPath: IndexPath) -> UITableViewCell {
        
        // Do we have any queue available for the given identifier?
        guard let queue = queueHash[identifier] else {
            fatalError("no cell with identifier")
        }
        
        // if the queue can pop an element we will return it
        if let cell = queue.dequeue() {
            return cell
        }
        
        // if there were no available elements we should return a new one
        // TODO: does UITableView retain any property with a common cell style?
        //       for now using default style.
        return UITableViewCell(style: .default,
                               reuseIdentifier: identifier)
    }
}


class Queue <T> {
    lazy var queue = [T]()
    
    func queue(value: T) {
        queue.insert(value, at: 0)
    }
    
    func dequeue() -> T? {
        return queue.removeLast()
    }
}


// some testing on the Queue
let q = Queue<Int>()
q.queue(value: 1)
q.queue(value: 1)
q.queue(value: 1)
q.queue(value: 1)
let a = q.dequeue()
print("dequeue: \(a)")
