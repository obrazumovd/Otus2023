//
//  Screen.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 27/06/2023.
//

import SwiftUI

struct Screen: Identifiable, Equatable {
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id: String = UUID().uuidString
    public let screen: AnyView
}
