import SwiftUI

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

