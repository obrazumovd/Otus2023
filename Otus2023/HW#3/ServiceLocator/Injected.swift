//
//  Injected.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 02/09/2023.
//

import Foundation

@propertyWrapper
struct Injected<Service:AnyObject> {
    private var service: Service?
    private weak var serviceLocator = Configurator.shared.serviceLocator
    

    public var wrappedValue: Service? {
        mutating get {
            if service == nil {
                service = serviceLocator?.getService(type: Service.self)
            }
            return service
        }
        mutating set {
            service = newValue
        }
    }
    
    public var projectedValue: Injected<Service> {
        mutating set {self = newValue}
        get {return self}
    }
}
