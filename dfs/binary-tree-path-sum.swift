// https://leetcode.com/problems/path-sum
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
  }
 
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        
        if root == nil
        {
            return false
        }
        if root?.left == nil && root?.right == nil && root?.val == sum 
        {
            return true
        }
        return hasPathSum(root?.left, sum - root!.val) || hasPathSum(root?.right, sum - root!.val)
    }
  
  func hasPathSumIterative(_ root: TreeNode?, _ sum: Int) -> Bool {
        
        var nr = root
        if nr == nil
        {
            return false
        }
        
        var s = stack()
        var currentSum: Int = 0
        var last:TreeNode? = nil
        
        while nr != nil || s.isEmpty() == false
        {
            while nr != nil
            {
                currentSum = currentSum + nr!.val
                s.push(nr)
                nr = nr?.left
            }
            
            nr = s.top()
            if nr?.left == nil && nr?.right == nil && currentSum == sum
            {
                return true
            }
            
            if nr?.right != nil && nr?.right != last 
            {
                nr = nr?.right
            }
            else
            {
                nr = s.pop()
                last = nr
                currentSum = currentSum - nr!.val
                nr = nil
            }
        }
        return false
        
    }
}
