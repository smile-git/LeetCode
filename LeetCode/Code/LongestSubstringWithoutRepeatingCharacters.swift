//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCode
//
//  Created by ZWX on 2018/9/14.
//  Copyright © 2018年 ZWX. All rights reserved.
//

import UIKit

/// 无重复字符的最长子串
class LongestSubstringWithoutRepeatingCharacters: NSObject {

    func LongestSubstringWithoutRepeatingCharacters() {
        
        print(self.lengthOfLongestSubstring("aaaaaaadgff"))
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        if s.count == 0 || s.count == 1 {
            return s.count
        }
        
        var dic = [String: Int]()
        var length: Int = 0  //记录每个无重复字符串长度
        var maxLen: Int = 0  //最大无重复字符串
        var lastP:  Int = 0  //记录之前重复字符的最近的位置
        var repSta: Int = 0  //本重复字符的一开始位置
        
        for count in 0...(s.count - 1) {
            
            let index1 = s.index(s.startIndex, offsetBy: count)
            let index2 = s.index(s.startIndex, offsetBy: count + 1)
            let subStr = String(s[index1..<index2]) //对字符串挨个取字符
            
            if dic[subStr] != nil {
                
                repSta = dic[subStr]!
                
                if (count - repSta) < (count - lastP) {
                    //如果本重复字符一开始位置 小于 之前重复字符开始位置，更新lastP
                    lastP = repSta
                    
                }
                length  = count - lastP
                
            } else {
                
                length = length + 1
            }
            
            if maxLen < length {
                
                maxLen = length
            }
            dic[subStr] = count
        }
        
        if maxLen == 0 {
            maxLen = s.count
        }
        return maxLen
    }
    
    func lengthOfLongestSubstringGod(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        let chars = s.cString(using: .utf8)!
        var left = 0
        var right = 1
        var maxLength = 1
        
        while right < chars.count - 1 {
            for i in left..<right {
                if chars[i] == chars[right] {
                    left = i + 1
                    break
                }
            }
            maxLength = max(maxLength, right - left + 1)
            right += 1
        }
        
        return maxLength
    }
}
