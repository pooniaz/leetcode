https://leetcode.com/problems/sum-root-to-leaf-numbers/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    
    func sumNumbersHelper(_ root: TreeNode?, _ sum: Int) -> Int
    {
        if root == nil
        {
            return 0
        }
       var  currentSum = (sum * 10) + root!.val
        if root?.left == nil && root?.right == nil
        {
            return currentSum
        }
        return sumNumbersHelper(root?.left, currentSum) + sumNumbersHelper(root?.right, currentSum)
    }
    
    func sumNumbers(_ root: TreeNode?) -> Int {
       return  sumNumbersHelper(root, 0)   
    }
}
