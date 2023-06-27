//
//  INavigationContainer.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 27/06/2023.
//

import SwiftUI

protocol ItemView: View {
    var listener: INavigationContainer? { get set }
}

protocol INavigationContainer {
    func push<Content: View& ItemView>(view: Content)
    func pop()
    func popToRoot()
}

struct NavigationContainer<Content:View&ItemView>: View, INavigationContainer {
    @ObservedObject var model = NavigationViewModel()
    private var content: Content

    init(@ViewBuilder content: @escaping() -> Content) {
        self.content = content()
        self.content.listener = self
    }

    var body: some View {
        let isRoot = model.currentScreen == nil
        return ZStack {
            if isRoot {
                content
            } else {
                model.currentScreen?.screen
            }
        }
    }
    func push<Content>(view: Content) where Content: View&ItemView {
        var view = view
        view.listener = self
        self.model.push(view.toAnyView())
    }
    
    func pop() {
        self.model.pop()
    }
    
    func popToRoot() {
        self.model.popToRoot()
    }
}
