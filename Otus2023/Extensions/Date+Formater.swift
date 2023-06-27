//
//  Date+Formater.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import Foundation

extension Date {
    func  dateForNews() -> String {
        let formater = DateFormatter()
        formater.dateFormat = "YYYY-MM-dd"
        return formater.string(from: self)
    }
}
