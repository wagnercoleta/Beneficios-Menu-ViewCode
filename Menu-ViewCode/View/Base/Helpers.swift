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

func formattedDate(_ value: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
    dateFormatter.locale = Locale.init(identifier: "pt-br")
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    let valueStr = dateFormatter.string(from: value)
    return valueStr
}

func getDate(hour: Int) -> Date {
    let today = Date()
    
    let modifiedDate = Calendar.current.date(byAdding: .hour, value: -hour, to: today)!
    
    return modifiedDate
}
