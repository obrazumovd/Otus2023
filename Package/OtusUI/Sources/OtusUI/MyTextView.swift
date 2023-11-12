//
//  SwiftUIView.swift
//  
//
//  Created by Dmitriy Obrazumov on 12/11/2023.
//

import SwiftUI

public struct MyTextView: UIViewRepresentable {
    @Binding var text: String
    
    public init(text: Binding<String>) {
        _text = text
    }

    public func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

