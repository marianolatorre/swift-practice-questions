/*
 Given two strings, write a method to decide if one is a permutation of the other.
 */

typealias Input = (a: String, b: String)

let passing: [Input] = [
    ("rock", "korc"),
    ("sample", "plemas")
]

let notPassing: [Input] = [
    ("hello","h"),
    ("goodbye","byegool")
]


func isPermutation(value: Input) -> Bool {
    
    guard value.a.count == value.b.count else {
        return false
    }
    
    return String(Array(value.a).sorted()) == String(Array(value.b).sorted())
}

for scenario in passing {
    print("Passing \(scenario) = \(isPermutation(value: scenario))")
}

for scenario in notPassing {
    print("Not passing \(scenario) = \(isPermutation(value: scenario))")
}

