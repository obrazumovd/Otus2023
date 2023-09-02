//
//  StorageModel.swift
//  Otus
//
//  Created by Dmitriy Obrazumov on 26/09/2022.
//

import Foundation
import OtusCore

class StorageModel: ObservableObject {
    @Injected private var storage: MokStorageService?
    
    @Published var savedData: [String: Any] = .init()
    @Published var error: Error?
    @Published var newDataText: String = .init()
    
    init() {
        updateSavedData()
    }
    
    func addData() {
        guard !newDataText.isEmpty else {
            self.error = MokStorageServiceError.dataNil
            return
        }
        storage?.saveData(key: UUID().uuidString, data: newDataText)
        newDataText = ""
        updateSavedData()
    }
    func deleteData(key: String) {
        do {
            try storage?.deleteData(key: key)
        } catch let error {
            self.error = error
        }
    }
    func hideError() {
        self.error = nil
    }
    func setNewDataText(_ text: String) {
        self.newDataText = text
    }
    
    private func updateSavedData() {
        self.savedData = storage?.getAllData() ?? [:]
    }
}
