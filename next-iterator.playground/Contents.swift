/*
implement linear print of nested arrays
[1,[4,3],6,[5,[1,0]]] = 1, 4, 3, 6, 5, 1, 0
 */
import Foundation

let input: [Any] = [1,[4,3],6,[5,[1,0]]]

func flatten(_ arr: [Any]) -> String {
    var result = ""
    for element in arr {
        if let element = element as? Int {
            result += "\(element), "
        }
        else if let element = element as? [Any] {
            result += flatten(element)
        }
    }
    return result
}

print(flatten(input))
