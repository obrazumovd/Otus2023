//
//  Otus2023App.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 18/06/2023.
//

import SwiftUI

@main
struct Otus2023App: App {
    init() {
        Configurator.shared.setup()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
