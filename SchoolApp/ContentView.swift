import SwiftUI

struct ContentView: View {
    @State private var username: String = "" //
    @State private var password: String = "" //
    
    var body: some View {
        ZStack {
            // 背景画像
            Image("background")
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
                
                Spacer().frame(height: 50)
                
                Button(action: {
                    print("ユーザー名: \(username), パスワード: \(password)")
                    
                }) {
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
                
                Spacer()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
