//
//  StorageView.swift
//  Otus
//
//  Created by Dmitriy Obrazumov on 26/09/2022.
//

import SwiftUI


struct StorageView: View {
    @StateObject var model: StorageModel = .init()
    var body: some View {
        mainView()
    }
}

private extension StorageView {
    func mainView() -> some View {
        return VStack {
            addDataView()
            errorView()
            listOfData()
        }
        .toAnyView()
    }
    func addDataView() -> some View {
        let binding = Binding(get: { model.newDataText },
                              set: { model.setNewDataText($0) })
        return HStack {
            TextField("NewData", text: binding)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            Button(action: { model.addData() }) {
                Text("Add")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding()
        .toAnyView()
    }
    func listOfData() -> some View {
        return List {
            ForEach(Array(model.savedData.keys), id: \.self) { testKey in
                if let data = model.savedData[testKey] as? String { EmptyView().toAnyView()
                    VStack(alignment: .leading) {
                        Text(testKey)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(data)
                            .fontWeight(.medium)
                    }
                }
            }
        }
        .toAnyView()
    }
    func errorView() -> some View {
        guard let error = model.error else { return EmptyView().toAnyView() }
        return HStack {
            Text(error.localizedDescription)
                .foregroundColor(.red)
            Button {
                model.hideError()
            } label: {
                Text("Ok")
            }
        }
        .toAnyView()
    }
}

struct StorageView_Previews: PreviewProvider {
    static var previews: some View {
        StorageView()
    }
}
