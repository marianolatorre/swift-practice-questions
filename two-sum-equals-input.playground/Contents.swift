/*

 Giving an array of numbers and an int, return true if is  there any pair of numbers inside the array that summed is equal to the input int, otherwise return false.
 */

import Foundation

typealias Scenario = (input: [Int], result: Int)

// test scenarios
let passing: [Scenario] = [
    ([1,2,3],3),
    ([1,1,1],2),
    ([2,1,1],3),
    ([1,1],2),
    ([1,2,3],4),
    ([0,0],0),
]

let notPassing: [Scenario] = [
    ([0,0],1),
    ([1,1,1],1),
    ([1,1,1],3),
]


func pairSumming(scenario: Scenario) -> Bool {
    var pos = 0
    while (pos <= scenario.input.count - 2 ) {

        if scenario.input[(pos+1)...].contains(scenario.result - scenario.input[pos]) {
            return true
        }
        pos += 1
    }
    return false
}

for scenario in passing {
    print("Passing \(scenario)=\(pairSumming(scenario: scenario))")
}

for scenario in notPassing {
    print("Not passing \(scenario)=\(pairSumming(scenario: scenario))")
}
