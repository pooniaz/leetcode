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
    func pathSumIter(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        
        
        var nr = root
        
        if nr == nil
        {
            return []
        }
        
        var s = stack()
        var pre:TreeNode? = nil
        var currentSum = 0
        
        var result:[[Int]] = [[Int]]()
        var currentPath:[Int] = [Int] ()
        
        while s.isEmpty() == false || nr != nil
        {
            while nr != nil
            {
                s.push(nr)
                currentPath.append(nr!.val)
                currentSum += nr!.val
                nr = nr?.left
            }
            
            nr = s.peek()
            if nr?.right != nil && ((nr?.right === pre) == false)
            {
                nr = nr?.right
                continue
            }
            
            if nr?.left == nil && nr?.right == nil && sum == currentSum
            {
                result.append(currentPath)
            }
            
            nr = s.pop()
            pre = nr
            currentSum -= nr!.val
            currentPath.removeLast()
            nr = nil
            
        }
        return result
    }
    public func findpath(_ root: TreeNode?, _ sum: Int, _ currentPath: inout [Int], _ allPaths: inout [[Int]])
    {
        if root == nil
        {
            return 
        }
        
        currentPath.append(root!.val)
        if root?.left == nil && root?.right == nil && root!.val == sum 
        {
            allPaths.append(currentPath)
        }
        else
        {
            findpath(root?.left, sum - root!.val, &currentPath, &allPaths)
            findpath(root?.right, sum - root!.val, &currentPath, &allPaths)
        }
        
        currentPath.removeLast()
    }
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
     
        var currentpath:[Int] = []
        var allpaths:[[Int]] = []
        findpath(root, sum, &currentpath, &allpaths)
        return allpaths
        
    }
    
    
}
