//
//  9CountOfSubsetsSumWithaGivenSum.swift
//  DynamicProgrammingTests
//
//  Created by Maveric on 28/9/23.
//

import XCTest

final class CountOfSubsetsSumWithaGivenSum: XCTestCase {

    
    func testExample() {
        let nums = [2,3,5,6,8,10]
        let ans = solve(nums, sum: 10)
        print("ANSWER: \(ans)")
        
    }
    func solve(_ nums: [Int], sum: Int) -> Int {
        var t = Array(repeating: [Int](repeating: 0, count: sum + 1), count: nums.count + 1)
        
        // base condition
        for i in 0...nums.count {
            t[i][0] = 1
        }
        
        // hypotheses
        for i in 1...nums.count {
            for j in 1...sum {
                if nums[i - 1] <= j {
                    t[i][j] = t[i - 1][j] + t[i - 1][j - nums[i - 1]]
                } else {
                    t[i][j] = t[i - 1][j]
                }
            }
        }
        printIntTable(t)
        return t[nums.count][sum]
    }
}
