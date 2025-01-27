import SwiftUI

struct SignUpView: View {
    @State private var Accountname: String = ""
    @State private var Mailname: String = ""
    @State private var Password: String = ""
    @StateObject private var viewModel = LoginViewModel()

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
                .padding(.bottom,100)

            VStack {
                Spacer()
//                    .frame(height: 150)
                Text("アカウント作成")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .padding(.bottom, 15)

                TextField("アカウント名", text: $Accountname)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)
                

                TextField("メールアドレス", text: $Mailname)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)

                TextField("パスワード", text: $Password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)

                
//                NavigationLink(destination:LogInAccountView()) {
//                    Text("アカウントを作成")
//                        .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 200, height: 50))
//                                    }

                Button(action: {
                    print("アカウントを作成ボタンが押されました")
                    viewModel.maccount()
                }) {
                    Text("アカウントを作成")
                        .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 200, height: 50))

                }
                Spacer()
            }
            
            .padding(.bottom,100)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding()
        }
    }
}

