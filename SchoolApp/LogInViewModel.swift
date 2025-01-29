import FirebaseAuth
import Combine

class LogInViewModel: ObservableObject {
    @Published var user = User()
    @Published var errorMessage: String? = nil
    func login() {//この関数が呼び出されたら以下のコードのことだよってこと！
        let email = user.mail
        let password = user.password
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in//{ authResult, error inはクロージャ関数ってやつで簡単に作りたい時作る
            if let error = error {//もしもエラーが発生したらそれをerrorという名前で取得するってこと
                DispatchQueue.main.async {//エラーを人間が読める様にするプロパティ
                    self.errorMessage = "ログインに失敗しました"
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

