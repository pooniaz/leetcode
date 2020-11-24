//https://leetcode.com/problems/binary-tree-inorder-traversal/
//  Definition for a binary tree node.
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
 

extension TreeNode : Equatable
{
    public static func ==(_ lhs:TreeNode, _ rhs:TreeNode ) -> Bool
    {
        return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
}

struct stack
{
    var items:[TreeNode] = []
    mutating func push(_ node: TreeNode?)
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
    
    func peek() -> TreeNode?
    {
        return items.last
    }
}

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var nr = root
        if nr == nil
        {
            return []
        }
        var s = stack()
        var result:[Int] = []
        while (!s.isEmpty() || nr != nil)
        {
            if nr != nil
            {
                s.push(nr)
                nr = nr?.left
            }
            else
            {
                nr = s.pop()
                result.append(nr!.val)
                nr = nr?.right    
            }             
        }
        return result
    }
}
