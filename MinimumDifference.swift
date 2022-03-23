//
//  MinimumDifference.swift
//  CodingChallenge
//
//  Created by Midori Verdouw on 23/3/2022.
//

import Foundation

func minimumDifference(numbers: [Int]) -> Void {
    let count = numbers.count
    
    var currentMinDiff = Int.max
    var pairs = [Pair]()
    
    for i in 0..<count {
        let currentNumber = numbers[i]
        
        for j in (i+1)..<count {
            let numberToCompare = numbers[j]
            
            let diff = abs(numberToCompare - currentNumber)
            
            if diff <= currentMinDiff {
                if diff < currentMinDiff {
                    currentMinDiff = diff
                    pairs.removeAll()
                }
                
                // append the found pair to the answer array
                // also decide which numbers comes first in the pair
                if currentNumber < numberToCompare {
                    pairs.append(Pair(item1: currentNumber, item2: numberToCompare))
                }
                else {
                    pairs.append(Pair(item1: numberToCompare, item2: currentNumber))
                }
            }
        }
    }
    
    pairs.sort()
    
    for pair in pairs {
        print("\(pair.item1), \(pair.item2)")
    }
}

struct Pair: Comparable {
    var item1: Int
    var item2: Int
    
    // lhs: left-hand side, rhs: right-hand side
    static func <(lhs: Pair, rhs: Pair) -> Bool {
        if lhs.item1 != rhs.item1 {
            return lhs.item1 < rhs.item1
        }
        else if lhs.item2 != rhs.item2 {
            return lhs.item2 < rhs.item2
        }
        else {
            return true
        }
    }
}

var numbers1 = [6, 2, 4, 10]
let numbers2 = [4, 2, 6, 8, 3, 55, 24, 9]

minimumDifference(numbers: numbers1)
minimumDifference(numbers: numbers2)
