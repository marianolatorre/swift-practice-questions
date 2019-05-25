/*
given an array of words, how to eliminate the duplicates?
 */

let input = ["hello","goodbye","hello"]

func removeDuplicates(arr: [String]) -> [String] {
    var hash = [String:Bool]()
    for elem in arr {
        hash[elem] = true
    }
    return Array(hash.keys)
}

print("\(removeDuplicates(arr: input))")
