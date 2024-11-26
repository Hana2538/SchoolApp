import SwiftUI

struct ContentView: View {
    @State private var username: String = "" //
    @State private var password: String = "" //

    var body: some View {
        VStack {
            Text("welcome")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .padding(.top, 100)
                .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
            
            Spacer().frame(height: 20)
            
            Text("ログイン")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
            
            Spacer().frame(height: 30)
            
            TextField("ユーザー名", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            SecureField("パスワード", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
            Spacer().frame(height: 20)
            
            Button(action: {
                print("ユーザー名: \(username), パスワード: \(password)")
            }) {
                Text("ログイン")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
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
