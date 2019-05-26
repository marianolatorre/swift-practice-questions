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
