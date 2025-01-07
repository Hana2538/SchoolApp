import SwiftUI

@main
struct SchoolAppApp: App {
    @State private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    LogInAccountView(isLoggedIn: $isLoggedIn) 
                        .tabItem {
                            Text("Home")
                            Image(systemName: "house.fill")
                                .font(.system(size: 100, weight: .bold))
                        }
                    AccountView()
                        .tabItem {
                            Text("Account")
                            Image(systemName: "person.circle")
                        }
                }
            }
        }
    }
}
