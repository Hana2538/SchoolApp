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
                
                Text("Home")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                
                VStack{
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
                        .padding(.bottom, 10)
                    
                    Button(action: {
                        print("入力ボタンが押されました")
                    }) {
                        Text("入力")
                            .modifier(MyTitle(color:Color(red: 0, green: 0.4, blue: 0.7)))
                    }
                    .padding(.bottom, 50)
                    
                    NavigationLink(destination:MakeRoomName()) { 
                        Text("問題を新規作成")
                            .modifier(MyTitle(color: .orange))
                                        }
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination:MyRoom()){
                        Text("My Room")
                            .modifier(MyTitle(color:.orange))
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
