//
//  Date+DateComponents.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 27/06/2023.
//

import Foundation

extension Date {
    func addingDay(_ day: Int) -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = day
        let featureDate = Calendar.current.date(byAdding: dateComponent, to: self)
        return featureDate ?? self
    }
}
