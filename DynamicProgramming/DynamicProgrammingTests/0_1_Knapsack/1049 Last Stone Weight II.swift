//
//  1049 Last Stone Weight II.swift
//  DynamicProgrammingTests
//
//  Created by Maveric on 29/9/23.
//
// 10 Minimum Subset Sum Difference

import XCTest

final class _049_Last_Stone_Weight_II: XCTestCase {
    func testExample() throws {
        //        let ans = lastStoneWeightII([2,7,4,1,8,1])
//        let ans = lastStoneWeightII([1, 2, 7])
        let ans = lastStoneWeightIIOptimised([1, 2, 7])

        print("ANSWER: \(ans)")
    }
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        let sum = stones.reduce(0, +)
        var t = Array(repeating: Array(repeating: false, count: sum + 1), count: stones.count + 1)
        var ranges = [Int]()
        var mn = Int.max
        
        // Base condition
        if stones.count == 1 {
            return stones[0]
        }
        
        for i in 0...stones.count {
            t[i][0] = true
        }
        
        // solve knapsack
        for i in 1...stones.count {
            for j in 1...sum {
                if stones[i - 1] <= j {
                    t[i][j] = t[i - 1][j] || t[i - 1][j - stones[i - 1]]
                } else {
                    t[i][j] = t[i - 1][j]
                }
                
                if t[stones.count][j], j <= sum/2 {
                    ranges.append(j)
                }
            }
        }
        printBoolTable(t)
        for range in ranges {
            mn = min(mn, sum - 2 * range)
        }
        
        return mn
    }
    
    
    // Leetcode optimization
    func lastStoneWeightIIOptimised(_ stones: [Int]) -> Int {
        let n = stones.count
        let s = stones.reduce(0, +)
        var s1 = 0
        var t = Array(repeating: Array(repeating: false, count: s/2 + 1), count: n + 1)
        // Base condition
        for i in 0...stones.count {
            t[i][0] = true
        }
        // solve knapsack
        for i in 1...stones.count {
            for j in 1...s/2 {
                t[i][j] = t[i - 1][j]
                if stones[i - 1] <= j {
                    t[i][j] = t[i - 1][j] || t[i - 1][j - stones[i - 1]]
                }
                if t[i][j] {
                    s1 = max(s1, j)
                }
            }
        }
        printBoolTable(t)
        return s - 2 * s1
    }
    
}
