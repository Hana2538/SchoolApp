import Foundation
import FirebaseAuth

class LogInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var isLoggedIn: Bool = false
    
    func logIn() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "すべてのフィールドを入力してください"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.errorMessage = "ログインに失敗しました: \(error.localizedDescription)"
                } else {
                    
                    self.isLoggedIn = true
                }
            }
        }
    }
}

