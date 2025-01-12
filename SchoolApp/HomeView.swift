import SwiftUI

struct HomeView: View {
    @State private var GamePin: String = ""
    var body: some View {
        ZStack {
            
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    TextField("ゲームPIN", text: $GamePin)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.horizontal, 20)
                        .frame(width: 400, height: 50)
                    
                    Button(action: {
                        print("入力ボタンが押されました。")
                    }) {
                        Text("入力")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 60)
                            .background(Color(red: 0, green: 0.4, blue: 0.7))
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        print("問題を新規作成ボタンが押されました。")
                    }) {
                        Text("問題を新規作成")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 60)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        print("マイルームボタンが押されました。")
                    }) {
                        Text("マイルーム")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 60)
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                }
                
                Spacer() 
            }
        }
    }
}

#Preview {
    HomeView()
}

