//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by ZWX on 2018/9/14.
//  Copyright © 2018年 ZWX. All rights reserved.
//

import UIKit

/// 两数相加
class AddTwoNumbers: NSObject {

    func addTwoNumbers() {
        
        let arr1 = [2,4,3]
        let arr2 = [5,6,4]
        
        let l1 = ListNode(0)
        let l2 = ListNode(0)
        
        for val in arr1 {
            
            self.appendNode(orderNode: l1, newNode: ListNode(val))
        }
        
        for val in arr2 {
            
            self.appendNode(orderNode: l2, newNode: ListNode(val))
        }
        
        
        
        var newNode: ListNode? = self.addTwoNumbers(l1, l2)
        
        for _ in arr1 {
            print(newNode?.val as Any)
            
            newNode = newNode?.next
        }
    }
    
    func addNode(head:ListNode, node:ListNode){
        
        var p  = head.next
        var q: ListNode! = head
        while (p != nil) {
            q = p
            p = p!.next
            
        }
        
        q.next = node
        
        //        print(q.next?.val as Any)
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let newNode = ListNode(0)
        var p = l1?.next
        var q = l2?.next
        
        var enter = 0
        
        while p != nil || q != nil {
            
            var num1 = 0
            var num2 = 0
            
            if p != nil {
                
                num1 = (p?.val)!
            }
            if q != nil {
                
                num2 = (q?.val)!
            }
            
            let sum = num1 + num2 + enter
            
            self.appendNode(orderNode: newNode, newNode: ListNode(sum % 10))
            
            enter = sum / 10
            
            p = p?.next
            q = q?.next
        }
        
        if enter > 0 {
            self.appendNode(orderNode: newNode, newNode: ListNode(enter))
        }
        
        return newNode.next
    }
    
    func appendNode(orderNode:ListNode, newNode: ListNode) {
        
        var p = orderNode.next
        var q: ListNode! = orderNode
        while(p != nil) {
            
            q = p
            p = p!.next
        }
        q.next = newNode
    }
}

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
