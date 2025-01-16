import SwiftUI

class RoomData: ObservableObject {
    @Published var roomName: String = "仮ルーム" // デフォルト値
}

struct MakeRoomName: View {
    @State private var roomname: String = ""
    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("問題を新規作成")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .foregroundColor(Color.orange)
                
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(red: 0, green: 0.4, blue: 0.7))
                        .frame(width: 350, height: 280)
                        .opacity(0.8)
                    
                    Text("ルームナンバーを作成")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 200)
                    
                    Text("ルーム名")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 120)
                        .padding(.leading, -150) // マイナスにしないと左に寄せれなかったから、これ.padding(.trailing, 10)が逆かも
                    
                    TextField("", text: $roomname)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .frame(width: 350, height: 50)
                        .padding(.bottom, 30)
                    
                    
                    NavigationLink(destination:MakeQuestionBase()) {
                        Text("作成")
                            .modifier(MyTitle(color: .orange))
                    }
                    .padding(.top,130)
                }
                Spacer()
            }
        }
    }
    
}
