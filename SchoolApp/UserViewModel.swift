import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "ログインに失敗しました: \(error.localizedDescription)"
                }
            } else if let user = authResult?.user {
                DispatchQueue.main.async {
                    self.errorMessage = nil
                    print("ログイン成功！: \(user.email ?? "メールアドレスなし")")
                }
            }
        }
    }
}
