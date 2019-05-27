/*
all substrings in common between two words
 */

let input = [ "helloalcjft": "loaadbcjfelloalcj",
              "mariano": "amarte",
              "anem": "cinema",
            ]


func findCommonSubstrs(stringA: String, stringB: String) -> [String] {

    let aSubStrings = Set(allSubstrings(word: stringA))
//    print(aSubStrings)
    let bSubstrings = Set(allSubstrings(word: stringB))
//    print(bSubstrings)

    let filtered = aSubStrings.intersection(bSubstrings)

    return Array(filtered)
}


func allSubstrings(word: String) -> [String] {

    guard word.count > 1 else {
        return [word]
    }

    var results = [String: Bool]()

    for start in 0...word.count-1 {
        for length in start...word.count-1 {
            let subs = String(Array(word)[start...length])
            results[subs] = true
        }
    }
    return Array(results.keys)
}

for item in input {
    print(findCommonSubstrs(stringA: item.key, stringB: item.value))
    print(String(repeating: "#", count: 100))
}


/*

 ["o", "f", "cj", "cjf", "ell", "ello", "el", "loal", "l", "alc", "j", "loalc", "oalc", "ll", "oa", "lloalc", "e", "lcj", "jf", "oalcj", "lloalcj", "elloalc", "loalcj", "elloal", "lc", "oal", "c", "lloa", "lo", "a", "lloal", "al", "elloalcj", "llo", "elloa", "alcj", "loa"]
 ####################################################################################################
 ["nem", "a", "n", "em", "ne", "m", "e"]
 ####################################################################################################
 ["a", "r", "m", "ar", "ma", "mar"]
 ####################################################################################################

 */
