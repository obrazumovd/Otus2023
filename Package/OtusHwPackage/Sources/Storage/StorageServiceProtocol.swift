//
//  StorageServiceProtocol.swift
//
//
//  Created by Dmitriy Obrazumov on 02/09/2023.
//

import Foundation

protocol StorageServiceProtocol: AnyObject {
    func getAllData() -> [String: Any]
    func getData(key: String) -> Any?
    func saveData(key: String, data: Any)
    func deleteData(key: String) throws
}
