import SwiftUI

@main
struct SchoolAppApp: App {
    init() {
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1)
        
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .white
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    LogInAccountView()
                        .tabItem {
                            Text("Login")
                            Image(systemName: "house.fill")
                                .font(.system(size: 100, weight: .bold))
                        }
                    
                    AccountView()
                        .tabItem {
                            Text("Account")
                            Image(systemName: "person.circle")
                        }
                    
                    HomeView()
                        .tabItem {
                            Text("Home")
                        }
                }
                
                .navigationBarTitle("吾輩はアプリである名前はまだない", displayMode: .inline)
                .navigationBarColor(backgroundColor: UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1), titleColor: .white) 
            }
        }
    }
}

// NavigationBarの色を設定する拡張
extension View {
    func navigationBarColor(backgroundColor: UIColor, titleColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor
    var titleColor: UIColor
    
    init(backgroundColor: UIColor, titleColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        content
    }
}
