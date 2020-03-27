//
//  Array+MergeSort.swift
//  Algo
//
//  Created by Lucas Kruk on 3/27/20.
//  Copyright © 2020 Lucas Kruk. All rights reserved.
//

import Foundation

extension Array where Element: Comparable{
    /**
        Merge Sort Given Array. TimeComplexity O(nLog(n))
     - returns
            - Sorted Array Using Merge Sort
            
     */
    func sortByMergeSort() -> [Element]{
        return mergeSort(array: self)
    }
    
    private func mergeSort(array arr:[Element])->[Element]{
        
        if arr.count <= 1{
            return arr
        }
        
        let mid = arr.count / 2
        var larray: [Element] = []
        var rarray: [Element] = []
        if mid > 1{
            larray = mergeSort(array: Array.init(arr[0..<mid]))
            rarray = mergeSort(array: Array.init(arr[mid..<arr.count]))
        }else {
            
            larray = Array.init([arr[0]])
            
            if arr.count > 2{
                rarray = mergeSort(array: Array.init(arr[1..<arr.count]))
            }else{
                rarray = Array.init([arr[1]])
            }
        }
    
        return merge(left: larray, right: rarray)
    }

   private func merge<T: Comparable>(left larray:[T], right rarray:[T]) -> [T]{
        
        var lpointer = 0
        var rpointer = 0
        var returnArray:[T] = []
        while lpointer < larray.count, rpointer < rarray.count{
            if larray[lpointer] <= rarray[rpointer]{
                returnArray += [larray[lpointer]]
                lpointer += 1
            }else{
                returnArray += [rarray[rpointer]]
                rpointer += 1
            }
        }
        
        if lpointer<larray.count{
            returnArray.append(contentsOf: larray[lpointer..<larray.count])
        }else if rpointer<rarray.count{
            returnArray.append(contentsOf: rarray[rpointer..<rarray.count])
        }
        
        return returnArray
    }
}
