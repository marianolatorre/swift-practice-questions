/*
 Giving an array of numbers and an int, return true if is there any pair of numbers inside the array that summed is equal to the input int, otherwise return false.
 */

let input = [4,5,1,7,3,82,2]

func matchSum(arr: [Int], value: Int) -> Bool {
    let sortedArray = arr.sorted() // O(n * log(n))
    print(sortedArray)

    var posX = 0
    var posY = 1

    while posX < sortedArray.count - 1 {
        while posY < sortedArray.count &&
            sortedArray[posX] + sortedArray[posY] <= value {
                if sortedArray[posX] + sortedArray[posY] == value {
                    print("pos:\(posX),\(posY) = \(sortedArray[posX]) \(sortedArray[posY])")
                    return true
                }
                posY += 1
        }
        posX += 1
        posY = posX+1
    }

    return false
}

print(matchSum(arr:input,value:7))
