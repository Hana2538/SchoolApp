import Foundation
import FirebaseAuth

class MakeAccountViewModel: ObservableObject {
    @Published var accountName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var isAccountCreated: Bool = false
    
    func createAccount() {
        guard !accountName.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "すべてのフィールドを入力してください"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.errorMessage = "アカウント作成に失敗しました: \(error.localizedDescription)"
                } else {
                    self.isAccountCreated = true
                }
            }
        }
    }
}
