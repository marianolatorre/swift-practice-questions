/*
Reverse string
 */

let scenarios = [
    "hello",
    "goodbye"
]

// using reverse O(1) and S(n)
func reverse(_ value: String) -> String {
    return String(value.reversed())
}

// using O(n) loop and string insert, S(n)
func reverseLoop(_ value: String) -> String {
    var result = ""
    for char in value {
        result.insert(char, at: result.startIndex)
    }
    return result
}

for input in scenarios {
    print(reverse(input))
}

for input in scenarios {
    print(reverseLoop(input))
}

/*
pair words that are anagrams to each other from an array of words
 assuming no duplicates in array for simplicity
 */

let candidates = ["hello","bye","olleh","aeyb","eyb"]

func findAnagramPairs(_ input: [String]) -> [(String,String)] {

    let invertedWords = candidates.compactMap{ reverse($0) }
    var results = [(String, String)]()

    var posX = 0
    var posY = 1

    while posX < candidates.count - 1 {
        posY = posX + 1
        while posY < candidates.count {
            if candidates[posX] == invertedWords[posY] {
                results.append((candidates[posX], candidates[posY]))
            }
            posY += 1
        }
        posX += 1
    }

    return results
}

print(findAnagramPairs(candidates))  //[("hello", "olleh"), ("bye", "eyb")]
