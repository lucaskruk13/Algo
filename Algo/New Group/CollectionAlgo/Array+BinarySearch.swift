//
//  Collection+BinarySearch.swift
//  Algo
//
//  Created by Lucas Kruk on 3/26/20.
//  Copyright © 2020 Lucas Kruk. All rights reserved.
//

import Foundation

extension Array where Element: Comparable{
    /**
       Simple Binary Search (Recursively)  to determine if an element exists in a collection. Does not guarentee the first Instance. Time Complexity O(log(n))
       - parameters:
           - elementToFind: Element to Look Up
           - inArray: Array Which possibably contains the element
    
       - Returns:
           - Boolean True if Exists, otherwise false
    */
    func binarySearch(lookup val:Element) -> Bool{
        
        return binarySearchRange(lookup: val, inRange: self.indices)
    }
    
    /**
       Simple Binary Search (Iteratively) to determine if an element exists in a collection. Does not guarentee the first Instance. Time Complexity O(log(n))
       - parameters:
           - elementToFind: Element to Look Up
           - inArray: Array Which possibably contains the element
    
       - Returns:
           - Boolean True if Exists, otherwise false
    */
    func binarySearchIterative(lookup val:Element) -> Bool{
        
        return binarySearchWithRangeIteratively(lookup: val, inRange: self.indices)
    }
    
    private func binarySearchRange(lookup val:Element, inRange range:Range<Int>) -> Bool{
        
        if range.lowerBound >= range.upperBound{
            return false
        }
        
        let mid = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if val < self[mid]{
            return binarySearchRange(lookup: val, inRange: range.lowerBound..<mid)
        }else if val > self[mid]{
            return binarySearchRange(lookup: val, inRange: mid+1..<range.upperBound)
        }else{
            return true
        }
    }
    
    
    private func binarySearchWithRangeIteratively(lookup val:Element, inRange range:Range<Int>)->Bool{
        
        var lowerBound = range.lowerBound
        var upperBound = range.upperBound - 1
        
        while upperBound >= lowerBound{
            let mid = lowerBound + (upperBound - lowerBound) / 2
            
            if self[mid] == val{
                return true
            }
            
            if val < self[mid]{
                upperBound = mid-1
            }else if val > self[mid]{
                lowerBound = mid+1
            }
        }
        
        return false
    }
}
