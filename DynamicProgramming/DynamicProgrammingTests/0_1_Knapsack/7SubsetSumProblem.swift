//
//  SubsetSumProblem.swift
//  DynamicProgrammingTests
//
//  Created by Maveric on 26/9/23.
//

import XCTest

final class SubsetSumProblem: XCTestCase {
//Input: set[] = {3, 34, 4, 12, 5, 2}, sum = 9

    func testExample() {
       let ans = solve(arr: [3, 34, 4, 12, 5, 2], sum: 7)
        print("ANSWER: \(ans)")
    }
    
    
    func testExample2() {
        let ans = solve(arr: [0], sum: 0)
        printBoolAnswer(ans, expectedOutput: true)
    }
    
    func solve(arr: [Int], sum: Int) -> Bool {
        var t = Array(repeating: Array(repeating: false, count: sum + 1), count: arr.count + 1 )
        // Base condition
        for i in 0...arr.count {
            for j in 0...sum {
                if j == 0 {
                    t[i][j] = true
                }
            }
        }

        // Hypothesis
        if arr.count > 0, sum > 0 {
            for i in 1...arr.count {
                for j in 1...sum {
                    if arr[i - 1] <= j {
                        let p1 = t[i - 1][j - arr[i - 1]]
                        let p2 = t[i - 1][j]
                        t[i][j] = p1 || p2
                    } else {
                        t[i][j] = t[i - 1][j]
                    }
                }
            }
        }
        printBoolTable(t)
        return t[arr.count][sum]
    }
}
