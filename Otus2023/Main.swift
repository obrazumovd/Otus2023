//
//  Main.swift
//  Otus2023
//
//  Created by Dmitriy Obrazumov on 18/06/2023.
//

import SwiftUI

struct Main: View {
   
    var body: some View {
        NavigationView {
            hwList
        }
    }
}

private extension Main {
    var hwList: some View {
        List {
            NavigationLink {
                HW1()
            } label: {
                Label("HW#1", systemImage: "1.circle")
            }
            NavigationLink {
                NavigationContainer {
                    NewsList()
                }
            } label: {
                Label("HW#2", systemImage: "2.circle")
            }
            NavigationLink {
                StorageView()
            } label: {
                Label("HW#4", systemImage: "4.circle")
            }

        }
    }
//    var tbView: some View {
//        TabView(selection: $selectionTab)  {
//            tab1
//                .tabItem { Label(
//                    title: { Text("Tab 1") },
//                    icon: { Image(systemName: "1.circle") }
//                ) }
//                .tag(1)
//            tab2
//                .tabItem { Label(
//                    title: { Text("Tab 2") },
//                    icon: { Image(systemName: "2.circle") }
//                ) }
//                .tag(2)
//            tab3
//                .tabItem { Label(
//                    title: { Text("Tab 3") },
//                    icon: { Image(systemName: "3.circle") }
//                ) }
//                .tag(3)
//            NavigationContainer {
//                NewsList()
//            }.tabItem {  Label("HW#2", systemImage: "list.dash") }
//            .tag(4)
//        }
//    }
    
    
    
    
}



struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
