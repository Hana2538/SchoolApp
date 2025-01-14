import SwiftUI

struct MyTitle: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .font(.system(size: 25))
            .foregroundColor(.white)
            .padding(.horizontal, 20) // 横！
            .padding(.vertical, 13)   // たて！
            .background(color)
            .cornerRadius(8)
    }
}

struct LogInAccountView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Image("kabegamiNone")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("welcome")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                        .padding(.top, 30)

                    Text("ログイン")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))

                    TextField("ユーザー名", text: $username)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .frame(width: 350, height: 50)

                    SecureField("パスワード", text: $password)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .frame(width: 350, height: 50)

                    Button(action: {
                        print("ログインボタンが押されました")
                    }) {
                        Text("ログイン")
                            .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7)))
                    }

                    NavigationLink(destination: SignUpView()) {
                        Text("アカウントをお持ちでない方はこちら")
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .foregroundColor(Color.blue)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
            }
        }
    }
}
