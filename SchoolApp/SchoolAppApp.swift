//
//  SchoolAppApp.swift
//  SchoolApp
//
//  Created by 吉村花菜 on 2024/11/22.
//

import SwiftUI

@main
struct SchoolAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    ContentView()
                        .tabItem {
                            Text("Home")
                            Image(systemName: "house.fill")
                                .font(.system(size: 100, weight: .bold))
                        }
                    AccountView()
                        .tabItem{
                            Text("Account")
                            Image(systemName:"person.circle")
                            
                        }
                }
            }
        }
    }
}
