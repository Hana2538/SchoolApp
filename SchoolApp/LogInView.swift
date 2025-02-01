import SwiftUI

struct MyTitle: ViewModifier {
    let color: Color
    let width: CGFloat
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(color)
            .cornerRadius(8)
    }
}


struct LogInView: View {
    @StateObject private var viewModel = LogInViewModel(user: User(name: "test", password: "test", email: "example@emailcom"), errorMessage: "")
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
                        viewModel.login()
                    }) {
                        Text("ログイン")
                            .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 200, height: 50))

                    }
                    if let errorMessage = viewModel.errorMessage {
                                    Text(errorMessage)
                                        .font(.system(size:15))
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                }

                    NavigationLink(destination: MakeAccountView()) {
                        Text("アカウントをお持ちでない方はこちら")
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .foregroundColor(Color.blue)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
    }
}
