// implement array rotation
let a = [1,2,3,4,5]

func rotLeft(a: [Int], d: Int) -> [Int] {

    guard d > 0 else {
        return a
    }
    let tempArray =  a[1...] + a[0...0]
    return rotLeft(a: Array(tempArray), d: d - 1)
}

print(rotLeft(a: a, d: 2))


// min number of swaps

let input = [2, 3, 4, 1, 5]

func numMinSwaps(a: [Int]) -> Int {

    print(a)
    guard a.count > 1 else {
        return 0
    }

    var arr = a

    let firstValue = arr[0]  // O(0)
    let valueOfMin = arr[1...].min()! // O(n)
    let indexOfMin = arr[1...].firstIndex(of: valueOfMin)! // O(n)

    if valueOfMin < firstValue {
        arr.swapAt(0, indexOfMin)
        return 1 + numMinSwaps(a: Array(arr[1...]))
    }
    return numMinSwaps(a: Array(arr[1...]))
}

print(numMinSwaps(a: input))
