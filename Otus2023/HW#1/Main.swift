//
//  Main.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 18/06/2023.
//

import SwiftUI

struct Main: View {
    @State var isShowModal = false
    @State var isActiveLink = false
    @State var selectionTab = 1
    @State var text: String = ""
    var body: some View {
        tbView
    }
}

private extension Main {
    var tbView: some View {
        TabView(selection: $selectionTab)  {
            tab1
                .tabItem { Label(
                    title: { Text("Tab 1") },
                    icon: { Image(systemName: "1.circle") }
                ) }
                .tag(1)
            tab2
                .tabItem { Label(
                    title: { Text("Tab 2") },
                    icon: { Image(systemName: "2.circle") }
                ) }
                .tag(2)
            tab3
                .tabItem { Label(
                    title: { Text("Tab 3") },
                    icon: { Image(systemName: "3.circle") }
                ) }
                .tag(3)
        }
    }
    
    var tab1: some View {
        VStack {
            MyTextView(text: $text)
                .frame(maxWidth: 200)
                .frame(maxHeight: 100)
                .padding()
                .background(Color.gray)
                
            Button(action: {
                selectionTab = 2
                Task {
                    try await Task.sleep(nanoseconds: 1_000_000_000 )
                    isActiveLink = true
                }
            }, label: {
                Text("To linkView")
            })
        }
    }
    var tab2: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: linkView, isActive: $isActiveLink) {
                        Text("To LinkView")
                    }
                    ForEach(1...10, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
        }
    }
    var tab3: some View {
        VStack {
            Button(action: { isShowModal.toggle() }, label: {
                Text("show modal")
            })
        }
        .sheet(isPresented: $isShowModal, content: {
            Text("ModalView")
        })
    }
    var linkView: some View {
        VStack {
            Text("Link View")
        }
    }
}

struct MyTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

#Preview {
    Main()
}
