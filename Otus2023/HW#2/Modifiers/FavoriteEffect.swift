//
//  FavoriteEffect.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 26/06/2023.
//

import SwiftUI

struct FavoriteEffect: GeometryEffect {
    let isOn: Bool
    var offsetX: CGFloat
    var offsetY: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { return AnimatablePair<CGFloat, CGFloat>(offsetX, offsetY) }
        set { offsetX = newValue.first
              offsetY = newValue.second
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        print("offsetX = \(offsetX) offsetY = \(offsetY)")
        return isOn ? ProjectionTransform(CGAffineTransform(translationX: offsetX, y: offsetY)) : ProjectionTransform()
    }
}
