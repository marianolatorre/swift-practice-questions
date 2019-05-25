/*
 Implement a method to perform basic string compression using the counts
 of repeated characters. For example, the string aabcccccaaa would become
 a2blc5a3. If the "compressed" string would not become smaller than the original
 string, your method should return the original string.
 */
typealias Scenario = (input: String, output: String)

let scenarios: [Scenario] = [
    ("aaaabbbcc","a4b3c2"),
    ("abc","a1b1c1"),
    ("abbbbbcccc","a1b5c4"),
    ("abcccaa","a1b2c3a2")
]

func compress(_ value: String) -> String {
    
    let count = value.count
    
    guard count != 0 else {
        return value
    }
    
    let values = Array(value)
    var currentValue = values[0]
    var currentCount = 1
    var pos = 1
    var result = ""
    
    while pos < count {
        if currentValue == values[pos] {
            currentCount += 1
        } else {
            result += String(currentValue)
            result += String(currentCount)
            
            currentValue = values[pos]
            currentCount = 1
        }
        pos += 1
    }
    
    result += String(currentValue)
    result += String(currentCount)
    
    return result.count > count ? value : result
}

for scenario in scenarios {
    print("Scenario: \(scenario); Compressed output= \(compress(scenario.input))")
}

