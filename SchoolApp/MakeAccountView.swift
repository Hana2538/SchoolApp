import SwiftUI

struct MakeAccountView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var userName: String = ""
    
    @State private var errorMessage: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.orange)
                .frame(width: 350, height: 400)
                .opacity(0.6)
                .padding(.bottom, 100)
            
            VStack {
                Spacer()
                Text("アカウント作成")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .padding(.bottom, 15)
                
                TextField("アカウント名", text: $userName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)
                
                TextField("メールアドレス", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)
                
                SecureField("パスワード", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)
                
                //                if let errorMessage = viewModel.errorMessage {
                //                    Text(errorMessage)
                //                        .foregroundColor(.red)
                //                        .padding(.bottom, 10)
                //                }
                
                Button(action: {
                    // パスワード確認チェック
                    guard password == confirmPassword else {
                        showError("パスワードが一致しません。")
                        return
                    }
                    
                    // 新規登録処理 (例: Firebase へ)
                    Task {
                        do {
                            // ここでユーザー名を含めて新規登録する
                            try await authVM.signUp(email: email, password: password, userName: userName)
                        } catch {
                            showError(error.localizedDescription)
                        }
                    }
                }) {
                    Text("アカウントを作成")
                        .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 200, height: 50))
                }
                
               
                
                Spacer()
            }
            .padding(.bottom, 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding()
        }
    }
    private func showError(_ msg: String) {
        errorMessage = msg
        showingAlert = true
    }
}
