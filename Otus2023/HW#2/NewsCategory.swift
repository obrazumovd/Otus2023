//
//  NewsCategory.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import Foundation

enum NewsCategory: CaseIterable {
    case apple
    case sport
    case helth
    
    var query: String {
        switch self {
        case .apple:
            return "apple"
        case .sport:
            return "sport"
        case .helth:
            return "stocks"
        }
    }
    
    var label: String {
        switch self {
        case .apple:
            return "Apple"
        case .sport:
            return "Sport"
        case .helth:
            return "Stocks"
        }
    }
}
