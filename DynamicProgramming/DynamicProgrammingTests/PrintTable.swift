//
//  PrintTable.swift
//  DynamicProgrammingTests
//
//  Created by Maveric on 27/9/23.
//

import Foundation
import XCTest
// MARK:
func printIntTable(_ t: [[Int]]) {
    print("    j --->")
    for (index,row) in t.enumerated() {
        let values = row.enumerated().map{ "\($0.offset):\($0.element)"}
        print("i:\(index) \(values)")
    }
    print()
}

func printBoolTable(_ t: [[Bool]]) {
    print("      j --->")
    for (index,row) in t.enumerated() {
        let values = row.enumerated().map{ "\($0.offset):\($0.element ? "T" : "F")"}
        print("i:\(index) \(values)")
    }
    print()
}

func printAnswer(_ ans: Int, expectedOutput: Int, _ function: String = #function) {
    print("ANSWER: \(ans), function: \(function)")
    XCTAssertEqual(ans, expectedOutput, "ANSWER: \(ans), EXPECTED: \(expectedOutput), test: \(function)")
}

func printBoolAnswer(_ ans: Bool, expectedOutput: Bool, _ function: String = #function) {
    print("ANSWER: \(ans), function: \(function)")
    XCTAssertEqual(ans, expectedOutput, "ANSWER: \(ans), EXPECTED: \(expectedOutput), test: \(function)")
}
