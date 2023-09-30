//
//  11 Count the number of subset with a given difference.swift
//  DynamicProgrammingTests
//
//  Created by Chetan on 30/9/23.
//

import XCTest

final class _1_Count_the_number_of_subset_with_a_given_difference: XCTestCase {
    func testExample() {
        
//    Input: N = 4, arr[] = [5, 2, 6, 4], diff = 3
//    Output: 1
//    Input: N = 5, arr[] = [1, 2, 3, 1, 2], diff = 1
//    Output: 5
        
        let ans = solve(nums: [1, 2, 3, 1, 2], diff: 1)
        print("ANSWER: \(ans)")
    }
    
    func solve(nums: [Int], diff: Int) -> Int {
        let n = nums.count
        let s = nums.reduce(0, +)
        let s1 = (s + diff)/2
        var t = Array(repeating: Array(repeating: 0, count: s1 + 1), count: n + 1)
        for i in 0...n {
            t[i][0] = 1
        }
        
        for i in 1...n {
            for j in 1...s1 {
                if nums[i - 1] <= j {
                    t[i][j] = t[i - 1][j] + t[i - 1][j - nums[i - 1]]
                } else {
                    t[i][j] = t[i - 1][j]
                }
            }
        }
        printIntTable(t)
        return t[n][s1]
    }

}
