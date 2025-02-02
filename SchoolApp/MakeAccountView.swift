import SwiftUI

struct MakeAccountView: View {
    @StateObject private var viewModel = MakeAccountViewModel()

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

                TextField("アカウント名", text: $viewModel.accountName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)
                
                TextField("メールアドレス", text: $viewModel.email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)

                SecureField("パスワード", text: $viewModel.password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 20)

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom, 10)
                }
                
                Button(action: {
                    viewModel.createAccount()
                }) {
                    Text("アカウントを作成")
                        .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 200, height: 50))
                }

                if viewModel.isLoading {
                    ProgressView()
                        .padding(.top, 10)
                }

                Spacer()
            }
            .padding(.bottom, 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding()
        }
    }
}
