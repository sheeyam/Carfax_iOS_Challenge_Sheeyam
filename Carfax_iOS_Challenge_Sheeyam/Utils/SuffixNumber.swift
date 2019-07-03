//
//  SuffixNumber.swift
//  Carfax_iOS_Challenge_Sheeyam
//
//  Created by Sheeyam Shellvacumar on 7/2/19.
//  Copyright © 2019 Sheeyam Shellvacumar. All rights reserved.
//

import Foundation

extension Double {
    func truncate(places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

// logic to add suffix to the numbers
func formatNumber(_ n: Int) -> String {
    
    let num = abs(Double(n))
    let sign = (n < 0) ? "-" : ""
    
    switch num {
        
    case 1_000_000_000...:
        var formatted = num / 1_000_000_000
        formatted = formatted.truncate(places: 1)
        return "\(sign)\(formatted)b"
        
    case 1_000_000...:
        var formatted = num / 1_000_000
        formatted = formatted.truncate(places: 1)
        return "\(sign)\(formatted)m"
        
    case 1_000...:
        var formatted = num / 1_000
        formatted = formatted.truncate(places: 1)
        return "\(sign)\(formatted)k"
        
    case 0...:
        return "\(n)"
        
    default:
        return "\(sign)\(n)"
        
    }
    
}
