/*
 write array quicksort
 */

import Foundation

extension Array where Element: Comparable {

    private func _quickSort(_ array: [Element], by areInIncreasingOrder: ((Element, Element) -> Bool)) -> [Element] {

        guard array.count >= 2 else { return array }

        var data = array

        let pivot = data.remove(at: 0)
        let leftArr = data.filter{ areInIncreasingOrder($0, pivot) }
        let rightArr = data.filter{ !areInIncreasingOrder($0, pivot) }
        let midle = [pivot]

        return _quickSort(leftArr, by: areInIncreasingOrder) +
            midle +
            _quickSort(rightArr, by: areInIncreasingOrder)
    }

    func quickSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        return _quickSort(self, by: areInIncreasingOrder)
    }
}

let arr = [400,120,12,65,3,11,5,345,14]


print(arr.quickSort(by: <))

// O(n * log(n))
// space is bit better than mergesort
