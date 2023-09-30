//
//  DiameterOfABinaryTree.swift
//  DynamicProgrammingTests
//
//  Created by Maveric on 23/9/23.
//

import XCTest

// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    public convenience init?(values: [Int?], offset: Int = 0) {
        guard offset < values.count, let value = values[offset] else {
            return nil
        }
        self.init(value)
        self.left = TreeNode(values: values, offset: 2 * offset + 1)
        self.right = TreeNode(values: values, offset: 2 * offset + 2)
    }
}

final class DiameterOfABinaryTree: XCTestCase {
    func test() {
        let ans = diameterOfBinaryTree(TreeNode(values: [1, 2, 3, 4, 5]))
       print(ans)
    }
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var maxLength = 0
        _ = solve(root: root, res: &maxLength)
        return maxLength
    }
    
    func solve(root: TreeNode?, res: inout Int) -> Int {
        //Base condition
        guard let root = root else {
            return 0
        }
        //Hypothesis
        let left = solve(root: root.left, res: &res)
        let right = solve(root: root.right, res: &res)
        
        //Induction
        let temp = max(left, right) + 1// not_going_throught_it
        let ans =  left + right // going_throught_it
        res = max(res, ans)
        return temp
    }
    

}
