/*
 implement function that checks if there are duplicate characters in a string
 */

let passing = [
    "rock",
    "sample",
    ]

let notPassing = [
    "hello",
    "goodbye",
]

// solution relying on secondary data strucures (array and hash)
func checkDupChars(value: String) -> Bool {
    
    var hash = [Character: Bool]()
    let array = Array(value)
    
    for elem in array {
        hash[elem] = true
    }
    
    return hash.count == array.count
}

for scenario in passing {
    print("Passing \(scenario) = \(checkDupChars(value: scenario))")
}

for scenario in notPassing {
    print("Not passing \(scenario) = \(checkDupChars(value: scenario))")
}
