/*
Phone interview question # 1: Given an array (for example , [ 1, 0, 2, 0, 0, 3, 4 ]), implement methods that 1. returns the number of non-zero elements (4) 2. moves the non-zero elements to the beginning of the array (the rest of the elements don't matter) -> both [ 1, 2, 3, 4, 0, 0, 0] and [ 4, 1, 3, 2, X, Y, Z ] are valid
 */

import Foundation

typealias Output = (Int, [Int])

/*
[ 1, 0, 2, 0, 0, 3, 4 ]
      x, y
 [ 1, 0, 2, 0, 0, 3, 4 ]
        x,       y
[ 1, 2, 2, 0, 0, 3, 4 ]
 */

let input = [ 1, 0, 2, 0, 0, 3, 4 ]
let output = (4, [ 1, 2, 3, 4, 0, 0, 0])

// using filter function
func countNonZero(arr: [Int]) -> Output {
    let nonZeroElems = arr.filter{$0 != 0}
    let zeroElems = arr.filter{$0 == 0}

    return (nonZeroElems.count, nonZeroElems+zeroElems)
}

// O(n) traversing array
func countNonZeroTrav(arr: [Int]) -> Output {
    var count = 0
    var posX = 0
    var posY = 1
    var result = Array(arr)

    while (posX < result.count && posY < result.count) {
        if result[posX] != 0 {
            posX += 1
            posY = max(posY, posX+1)
            count += 1
        }
        else { // found a zero in X
            // need to find a non-zero in Y to write in X
            while (posY < result.count && result[posY] == 0) {
                posY += 1
            }
            if posY < result.count {
                result[posX] = result[posY]
                result[posY] = 0
            }

            posX += 1
            posY += 1
        }
    }
    return (count, result)
}


print("\(input)=\(output)=\(countNonZero(arr: input))")
print("\(input)=\(output)=\(countNonZeroTrav(arr: input))")
