import SwiftUI
import FirebaseAuth

class MakeAccountViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
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
