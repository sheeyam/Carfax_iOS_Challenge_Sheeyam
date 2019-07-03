//
//  ListPriceFormatter.swift
//  Carfax_iOS_Challenge_Sheeyam
//
//  Created by Sheeyam Shellvacumar on 7/2/19.
//  Copyright © 2019 Sheeyam Shellvacumar. All rights reserved.
//

import Foundation

// logic to format list price
func ListPriceFormatter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = NumberFormatter.Style.decimal
    
    let amount = price
    let formattedString = formatter.string(for: amount)
    return formattedString ?? String(price)
}
