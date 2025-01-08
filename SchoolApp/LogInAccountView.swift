import SwiftUI

struct ContentView: View {
    var body: some View {
        LogInAccountView()
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

                VStack {
                    Text("welcome")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .padding(.top, 150)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))

                    Spacer().frame(height: 20)

                    Text("ログイン")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))

                    Spacer().frame(height: 20)

                    TextField("ユーザー名", text: $username)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.horizontal, 20)
                        .frame(width: 400, height: 50)

                    Spacer().frame(height: 25)

                    SecureField("パスワード", text: $password)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.horizontal, 20)
                        .frame(width: 400, height: 50)

                    Spacer().frame(height: 10)

                    NavigationLink(destination: HomeView()) {
                        Text("ログイン")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 60)
                            .background(Color(red: 0, green: 0.4, blue: 0.7))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 20)

                    NavigationLink(destination: SignUpView()) {
                        Text("アカウントをお持ちでない方はこちら")
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .foregroundColor(Color.blue)
                            .padding()
                    }
                    .padding(.top, 20)

                    Spacer()
                }
            }
        }
    }
}

struct SignUpView: View {
    @State private var Accountname: String = ""
    @State private var Mailname: String = ""
    @State private var Password: String = ""

    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            RoundedRectangle(cornerRadius: 25)
                .fill(Color.orange)
                .frame(width: 350, height: 500)
                .opacity(0.5)

            VStack {
                Spacer().frame(height: 150)

                Text("アカウント作成")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .padding(.bottom, 20)

                TextField("アカウント名", text: $Accountname)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 30)
                
                //あれれ色変わってる

                TextField("メールアドレス", text: $Mailname)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 30)

                TextField("パスワード", text: $Password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 30)

                Spacer().frame(height: 10)

                Button(action: {
                    print("アカウント作成ボタンが押されました。")
                }) {
                    Text("作成")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color(red: 0, green: 0.4, blue: 0.7))
                        .cornerRadius(8)
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding()
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("ホーム画面")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
