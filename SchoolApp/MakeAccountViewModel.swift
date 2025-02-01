import SwiftUI
import FirebaseAuth

class MakeAccountViewModel: ObservableObject{
    var user: User
    //
    init(user: User) {
        self.user = user
    }
    func maccount(){
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, error in
            if let user = result?.user {
                let request = user.createProfileChangeRequest()
                request.displayName = user.displayName
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
