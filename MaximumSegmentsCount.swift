//
//  MaximumSegmentsCount.swift
//  CodingChallenge
//
//  Created by Midori Verdouw on 23/3/2022.
//

import Foundation

func findMaxSubsegmentsCount(arr: [Int]) -> Int {
   segmentArray(arr: arr, segmentsCount: 0)
}

func segmentArray(arr: [Int], segmentsCount: Int) -> Int {
    var arrCopy = arr
        
    guard !arrCopy.isEmpty else { return segmentsCount }
    
    // find the largest integer
    let max = arrCopy.max()!
    
    let maxIndex = arrCopy.firstIndex(of: max)!
    
    // split the array such that the largest integer is the first element of the right chunk
    let rightChunk = arrCopy[maxIndex...]
    let leftChunk = arrCopy[..<maxIndex]
    
    if !leftChunk.isEmpty {
        // find the smallest integer from the right chunk and the largest integer from the left chunk
        let rightMin = rightChunk.min()!
        let leftMax = leftChunk.max()!
        
        arrCopy.removeSubrange(maxIndex...)
    
        if rightMin >= leftMax {
            return segmentArray(arr: arrCopy, segmentsCount: segmentsCount + 1)
        }
        else {
            return segmentArray(arr: arrCopy, segmentsCount: segmentsCount)
        }
    }
    else {
        return segmentArray(arr: Array(leftChunk), segmentsCount: segmentsCount + 1)
    }
}

let arr1 = [2, 1, 3, 2, 4, 4, 5, 8, 7, 7]
print(findMaxSubsegmentsCount(arr: arr1))   // 5

let arr2 = [2, 5, 1, 9, 7, 6]
print(findMaxSubsegmentsCount(arr: arr2))   // 2
