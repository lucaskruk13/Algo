//
//  Int+RandomNum.swift
//  Algo
//
//  Created by Lucas Kruk on 3/26/20.
//  Copyright © 2020 Lucas Kruk. All rights reserved.
//

import Foundation

extension Int{
    var arc4random: Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}
