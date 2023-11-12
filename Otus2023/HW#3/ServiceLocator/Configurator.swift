//
//  Configurator.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 02/09/2023.
//

import Foundation
import OtusHwPackage

class Configurator {
    static let shared = Configurator()
    let serviceLocator = ServiceLocator()
    
    func setup() {
        registerServices()
    }
    
    private func registerServices() {
        serviceLocator.addService(service: MokStorageService())
        serviceLocator.addService(service: NewsService())
    }
}
