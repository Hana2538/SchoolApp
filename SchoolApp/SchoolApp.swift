import SwiftUI

@main
struct SchoolApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init() {
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1)
        
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .white
        
        // iOS 15以降の場合、scrollEdgeAppearanceも設定
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
                    
                    EditAccountView()
                        .tabItem {
                            Text("Account")
                            Image(systemName: "person.circle")
                        }
                    
                    HomeView()
                        .tabItem {
                            Text("Home")
                        }
                }.accentColor(.orange)
            }
        }
    }
}

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

