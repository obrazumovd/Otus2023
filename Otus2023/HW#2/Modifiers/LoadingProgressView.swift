//
//  LoadingProgressView.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import SwiftUI

struct LoadingProgressView: ViewModifier {
    let withLoading: Bool
    
    func body(content: Content) -> some View {
        if withLoading {
            VStack {
                content
                Divider()
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        } else {
            content
        }
    }
}
