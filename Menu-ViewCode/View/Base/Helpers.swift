//
//  Helpers.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 24/06/22.
//

import Foundation

func formattedValue(_ value: Decimal) -> String {
    let brLocale = Locale(identifier: "pt-BR")
    let numberFormatter = NumberFormatter()
    numberFormatter.usesGroupingSeparator = brLocale.groupingSeparator != nil
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = brLocale
    let result = numberFormatter.string(from: value as NSNumber)!
    return result
}
