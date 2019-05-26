/*
 Given two unsorted arrays, one with event start times and one with end times, find out if any two events overlap.
 */

import Foundation

let startTimes = [80,1,20,100,10]
let endTimes   = [140,11,30,120,22]


typealias Result = [((Int, Int),(Int,Int))]

func checkOverlaps(starts: [Int], ends: [Int]) -> Result {

    let count = starts.count
    var results = Result()

    guard count > 0 else {
        return results
    }

    let firstStart = starts[0]
    let firstEnd   = ends[0]

    var pos = 1

    while pos < count {

        let posStart = starts[pos]
        let posEnd = ends[pos]

        if doOverlap(firstStart, firstEnd, posStart, posEnd) {
            results += [((firstStart,firstEnd),(posStart,posEnd))]
        }
        pos += 1
    }

    results += checkOverlaps(starts: Array(starts[1...]), ends: Array(ends[1...]))

    return results
}

func doOverlap(_ firstStart: Int, _ firstEnd: Int, _ posStart: Int, _ posEnd: Int) -> Bool {

    let topOverlap = posEnd > firstEnd && posStart < firstEnd
    let bottomOverlap = posStart < firstStart && posEnd > firstStart
    let firstEmbeds = firstEnd > posEnd && firstStart < posStart
    let posEmbeds = posEnd > firstEnd && posStart < firstStart

    return topOverlap || bottomOverlap || firstEmbeds || posEmbeds
}


let results = checkOverlaps(starts: startTimes, ends: endTimes)

print(results)
