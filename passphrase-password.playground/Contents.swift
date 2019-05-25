/*
a telephone keypad has letters associated with each number  (e.g. 2 = abc, 3 = def); given a passphrase of "fbc" (e.g. one that you might use to log into a bank account), come up with an algorithm that would assemble an array that contains all the different possible letter combinations that, when typed into a telephone dial pad, would be equivalent to the original passphrase.
 */

typealias DialPad = [Int:String]
typealias ReverseDialPad = [Character: Int]

let myDialPad: DialPad = [1: "abc",
               2: "def",
               3: "ghi",
               4: "jkl",
               5: "mno",
               6: "pqr",
               7: "stu",
               8: "vwx",
               9: "yz"
]

//reverses dial pad from the character mapping to the associated number
func reverseDialPad(dialPad: DialPad) -> ReverseDialPad {
    var result = ReverseDialPad()

    for button in myDialPad {
        for letter in Array(button.value) {
            result[letter] = button.key
        }
    }
    return result
}

func possibleCombinations(_ value: String, dialPad: DialPad) -> [String] {
    // let's get the reverse dial pad
    let reverseDP = reverseDialPad(dialPad: dialPad)

    // let's get the numbers associated with "value" eg afp -> [1,2,6]
    let numbers = Array(value).compactMap { reverseDP[$0] }

    // an array with each character set to produce combinations
    var characters = [String]()
    for number in numbers {
        if let x = dialPad[number] {
            characters.append(x)
        }
    }

    return combinations(characters)
}

func combinations(_ arr: [String]) -> [String] {
    print("arr combinations: \(arr)")
    guard arr.count != 1 else {
        let a = Array(arr[0]).compactMap{String($0)}
        return a
    }
    var result = [String]()
    let nextSlice = Array(arr[1...])
    let currentElement = Array(arr[0])
    let subresults = combinations(nextSlice)

    for char in currentElement {
        for subresult in subresults {
            result.append(String(char) + subresult)
        }
    }
    return result
}

let result = possibleCombinations("afpz", dialPad: myDialPad)
print("Result: \(result)")
print("combinations: \(result.count)")

