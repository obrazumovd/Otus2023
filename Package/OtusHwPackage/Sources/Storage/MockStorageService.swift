//
//  MockStorageService.swift
//  Otus
//
//  Created by Dmitriy Obrazumov on 26/09/2022.
//

import Foundation

public enum MokStorageServiceError: Error {
    case keyInvalidate
    case dataNil
}

protocol MokStorageServiceProtocol: AnyObject {
    func getAllData() -> [String: Any]
    func getData(key: String) -> Any?
    func saveData(key: String, data: Any)
    func deleteData(key: String) throws
}

final public class MokStorageService:  MokStorageServiceProtocol {
    private var storage: [String: Any] = .init()
    
    public init() {}
    
    public func getAllData() -> [String : Any] {
        return storage
    }
    
    public func getData(key: String) -> Any? {
        return storage[key]
    }
    
    public func saveData(key: String, data: Any) {
        storage[key] = data
    }
    
    public func deleteData(key: String) throws {
        guard storage[key] != nil else {
            throw MokStorageServiceError.keyInvalidate
        }
        storage.removeValue(forKey: key)
    }
    
}
