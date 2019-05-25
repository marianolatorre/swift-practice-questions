/*
Giving a circular sorted array Ex: [7,9,3,5,6], write an algorithm that finds the smaller element index.
 */


let inputs = [
    [7,9,8,5,6],
    [7,1,2,5,6],
    [7,9,10,5,6],
    [7,9,0,-1,5,6]
]


func findSmaller(arr: [Int]) -> Int {
    var pos = 0
    let lowest = arr[0]

    while pos < arr.count {
        if arr[pos] < lowest {
            return pos
        }
        pos += 1
    }
    return pos
}


for input in inputs {
    print("input \(input)=\(findSmaller(arr: input))")
}

