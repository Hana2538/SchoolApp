import FirebaseAuth
import Combine

class LogInViewModel:ObservableObject{
    var user : User
    var errorMessage: String?
    init(user: User, errorMessage: String?) {
        self.user = user
        self.errorMessage = errorMessage
    }
    func login() {//この関数が呼び出されたら以下のコードのことだよってこと！
        let email = user.email
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

