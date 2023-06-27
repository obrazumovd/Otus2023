//
//  CharacterCell+Loading.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import SwiftUI

extension View {
    func progressBar(isLoading: Bool) -> some View {
        self.modifier(LoadingProgressView(withLoading: isLoading))
    }
}
