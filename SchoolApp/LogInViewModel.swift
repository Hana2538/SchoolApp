import FirebaseAuth

class LogInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var errorMessage: String? = nil
    
    func login() {//この関数が呼び出されたら以下のコードのことだよってこと！
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
    
    func maccount(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                let request = user.createProfileChangeRequest()
                request.displayName = self.name
                request.commitChanges { error in
                    if error == nil {
                        user.sendEmailVerification() { error in
                            if error == nil {
                                print("仮登録画面へ")
                            }
                        }
                    }
                }
            }
        }
    }
}


