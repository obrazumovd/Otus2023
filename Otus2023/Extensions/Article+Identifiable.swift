//
//  Article+Identifiable.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import Foundation
import NewsApi23

extension Article: Identifiable {
    public var id: String { url }
}
