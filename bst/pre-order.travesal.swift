//https://leetcode.com/problems/binary-tree-preorder-traversal/
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
  }
 


struct stack 
{
    var items:[TreeNode] = []
    
    mutating func  push(_ node: TreeNode?)
    {
        if let nd = node
        {
            items.append(nd)    
        }
    }
    
    mutating func pop() -> TreeNode
    {
        return items.removeLast()
    }
    
    func size() -> Int
    {
        return items.count
    }
    
    func isEmpty() -> Bool
    {
        return items.count == 0
    }
    
    
}



class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var nr = root
        var result:[Int] = []
        
        if nr == nil
        {
            return []
        }
        
        var s = stack()
        s.push(nr)
        
        while !s.isEmpty()
        {
            nr = s.pop()
            result.append(nr!.val)
            if nr?.right != nil
            {
                s.push(nr?.right)
            }
            
            if nr?.left != nil
            {
                s.push(nr?.left)
            }
            
        }
        return result
    }
}
