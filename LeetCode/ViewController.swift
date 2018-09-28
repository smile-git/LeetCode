//
//  ViewController.swift
//  LeetCode
//
//  Created by ZWX on 2018/9/14.
//  Copyright © 2018年 ZWX. All rights reserved.
//

enum ProblemsType: Int {
    case TwoSum_1
    case AddTwoNumbers_2
    case LongestSubstringWithoutRepeatingCharacters_3
}

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.leetCodeFunc(type: .LongestSubstringWithoutRepeatingCharacters_3)
        
    }
    
    func leetCodeFunc(type: ProblemsType) {
        
        switch type {
        case .TwoSum_1:
            TwoSum.init().twoSum()
        case .AddTwoNumbers_2:
            AddTwoNumbers.init().addTwoNumbers()
        case .LongestSubstringWithoutRepeatingCharacters_3:
            LongestSubstringWithoutRepeatingCharacters.init().LongestSubstringWithoutRepeatingCharacters()
//        default: break
            
        }
    }

    
    
}
