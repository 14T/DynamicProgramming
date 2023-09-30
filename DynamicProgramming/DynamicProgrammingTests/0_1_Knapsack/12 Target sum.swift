//
//  12 Target sum.swift
//  DynamicProgrammingTests
//
//  Created by Chetan on 30/9/23.
//
// Leetcode: 494. Target Sum https://leetcode.com/problems/target-sum/description/

//Example 1:
//
//Input: nums = [1,1,1,1,1], target = 3
//Output: 5
//Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
//-1 + 1 + 1 + 1 + 1 = 3
//+1 - 1 + 1 + 1 + 1 = 3
//+1 + 1 - 1 + 1 + 1 = 3
//+1 + 1 + 1 - 1 + 1 = 3
//+1 + 1 + 1 + 1 - 1 = 3
//Example 2:
//
//Input: nums = [1], target = 1
//Output: 1

//Input: nums = [1], target = 2
//Output: 0

//nums = [1000], target =-1000
import XCTest

final class _2_Target_sum: XCTestCase {
    
    func testExample() throws {
        let ans = solve(nums: [1], target: 2)
        printAnswer(ans, expectedOutput: 0)
    }
    func testExample1() throws {
        let ans = solve(nums: [1,1,1,1,1], target: 3)
        printAnswer(ans, expectedOutput: 5)
    }
    func testExample2() throws {
        let ans = solve(nums: [1000], target: -1000)
        printAnswer(ans, expectedOutput: 1)
    }
    func testExample4() throws {
        let ans = solve(nums: [1,1,1], target: -3)
        printAnswer(ans, expectedOutput: 1)
    }
    
    func testExample5() throws {
        let ans = solve(nums: [0,0,0,0,0,0,0,0,1], target: 1)
        printAnswer(ans, expectedOutput: 256)
    }
    func testExample6() throws {
        let ans = solve(nums: [1, 0], target: 1)
        printAnswer(ans, expectedOutput: 2)
    }
    func testExample7() throws {
        let ans = solve(nums: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], target: 0)
        printAnswer(ans, expectedOutput: 1048576)
    }
    
    func solve(nums: [Int], target: Int) -> Int {
        var nums = nums
        let z = nums.filter{$0 == 0}.count //count all zeros
        nums = nums.filter{$0 != 0} // remove all zeros
        let target = abs(target)
        let n = nums.count // size of array
        let s = nums.reduce(0, +) // sum of array
        let s1 = (s + target)/2 // sum of subset
        
        // Because the sum of a subset can't be in decimals
        if s < target {
            return 0
        }
        if (s + target) % 2 != 0 {
            return 0
        }
        var t = Array(repeating: Array(repeating: 0, count: s1 + 1), count: n + 1)
        
        // base condition
        for i in 0...n {
            t[i][0] = 1
        }
        
        if n > 0, s1 > 0 {
            for i in 1...n {
                for j in 1...s1 {
                    t[i][j] = t[i - 1][j]
                    if nums[i - 1] <= j {
                        t[i][j] = t[i - 1][j] + t[i - 1][j - nums[i - 1]]
                    }
                }
            }
        }
        printIntTable(t)
        // Each zero can be put in either of the partitions, so 2^z ways to do this
        let zeroPermutation = 2 << (z - 1)
        return t[n][s1] * zeroPermutation
    }
    
}
