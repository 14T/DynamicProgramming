//
//  EqualSumPartition.swift
//  DynamicProgrammingTests
//
//  Created by Maveric on 27/9/23.
//

import XCTest

final class EqualSumPartition: XCTestCase {
    //Input: set[] = [1,5,11,5]
    
    func testExample() {
        let ans = solve(arr: [1, 5, 11, 9])
//        let ans = canPartition([1, 5, 11, 9])
        print("ANSWER: \(ans)")
    }
    
    func solve(arr: [Int]) -> Bool {
        let sum = arr.reduce(0, +)
        //        base sondition
        if sum%2 != 0 {
            return false
        } else {
            return solveKnapsack(arr: arr, sum: sum/2)
        }
    }
    
    func solveKnapsack(arr: [Int], sum: Int) -> Bool {
        // Initialization
        var t = Array(repeating: Array(repeating: false, count: sum + 1), count: arr.count + 1)
//        for i in 0...arr.count {
//            for j in 0...sum {
//                if j == 0 {
//                    t[i][j] = true
//                }
//            }
//        }
        
        for i in 0...arr.count {
            t[i][0] = true
        }
        for i in 1...arr.count {
            for j in 1...sum {
                if arr[i - 1] <= j {
                    let t1 = t[i - 1][j]
                    let t2 = t[i - 1][j - arr[i - 1]]
                    t[i][j] = t1 || t2
                } else {
                    t[i][j] = t[i - 1][j]
                }
            }
        }
        
        printBoolTable(t)
        return t[arr.count][sum]
    }
    
}

// MARK: Leetcode best solution
extension EqualSumPartition {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        if sum % 2 != 0 {
            return false
        }
        let target = sum / 2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        for num in nums {
            for i in stride(from: target, through: num, by: -1) {
                dp[i] = dp[i] || dp[i - num]
            }
        }
        return dp[target]
    }
}
