import Foundation


/*
 Write a function to return if two words are exactly "one edit" away, where an edit is:

 - Inserting one character anywhere in the word (including at the beginning and end)
 - Removing one character
 - Replacing exactly one character

 assumption: no spaces used in input
 */


/*
 A - B = 0 ==> max one swap
 A -B = 1 ==> one deletion
 A- B = -1 ==> one addition

 */


typealias TwoWords = (first: String, second: String)

let passing: [TwoWords] = [
    ("",""),
    ("a","a"),
    ("hello","hello"),
    ("hello","helo"),
    ("hello","hell"),
    ("hello","ello"),
    ("hello","helo"),
]
let notPassing: [TwoWords] = [
        ("hello","hel"),
                              ("hello","heo"),
                              ("hello","llo"),
                              ("hello","hlo"),
                              ("hello","")
]


func distanceOne(twoWords: TwoWords) -> Bool {
    guard abs(twoWords.first.count - twoWords.second.count) <= 1 else {
        return false
    }

    if twoWords.first.count == twoWords.second.count {
        if twoWords.first.count == 0 {
            return true
        }

        var swapCount = 0
        let firstWordArr = Array(twoWords.first)
        let secondWordArr = Array(twoWords.second)

        var position = 0

        while position < firstWordArr.count {
            if firstWordArr[position] != secondWordArr[position] {
                if swapCount == 1 {
                    return false
                }
                swapCount += 1
            }
            position += 1
        }
    }
    else {
        var diffCount = 0
        var maxCountWord = twoWords.first
        var minCountWord = twoWords.second

        if twoWords.first.count < twoWords.second.count {
            maxCountWord = twoWords.second
            minCountWord = twoWords.first
        }

        let maxWordArr = Array(maxCountWord)
        let minWordArr = Array(minCountWord)

        var positionMax = 0
        var positionMin = 0

        while(positionMin < minWordArr.count) {
            if minWordArr[positionMin] != maxWordArr[positionMax] {
                if diffCount == 1 {
                    return false
                }
                diffCount += 1
            }
            else {
                positionMin += 1
            }
            positionMax += 1
        }
    }
    return true
}


for sample in passing {
    print("Passing: \(sample)=\(distanceOne(twoWords:sample))")
}

for sample in notPassing {
    print("Not passing: \(sample)=\(distanceOne(twoWords:sample))")
}
