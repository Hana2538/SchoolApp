import SwiftUI

struct SubjectRoom: View{
    var body: some View{
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                
                Spacer()
                
                Text("仮ルーム")
                    .font(.system(size:45))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .multilineTextAlignment(.center)
                
                
                NavigationLink(destination:MakeQuestionBase()){
                    Text("問題を編集")
                        .modifier(MyTitle(color: .orange, width: 250, height: 70))
                }
                
                .padding(.bottom,30)
                
                NavigationLink(destination:RankingView()){
                    Text("ランキングをチェック")
                        .modifier(MyTitle(color: .orange, width: 250, height: 70))
                }
                
                .padding(.bottom,30)
                
                NavigationLink(destination:Timer()){
                    Text("タイマー")
                        .modifier(MyTitle(color: .orange, width: 250, height: 70))
                }
                .padding(.bottom,100)
                
                
                Spacer()
            }
        }
    }
}
