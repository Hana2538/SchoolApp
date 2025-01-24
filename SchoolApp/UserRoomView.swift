import SwiftUI

struct UserRoomView: View{
    @State private var points: Int = 0
    @State private var questionCode: String = ""
    @State private var showingModal = false
    var body:some View{
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                
                Text("仮ルーム")
                    .font(.system(size:50))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                
                Text("問題作成者")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .padding(.leading,250)
                
                Text("ただいまのポイント")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .padding(.trailing,200)
                    .padding(.top,30)
                
                HStack {
                    Spacer()
                    
                    Text("\(points)")
                        .font(.title)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .frame(width: 100, height: 50)
                    
                    Text("pt")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
                TextField("問題コード", text: $questionCode)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                    .frame(width: 400, height: 50)
                    .padding(.bottom, 10)
                
                Button(action: {
                    showingModal = true
                }) {
                    Text("入力")
                        .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 200, height: 50))
                        .padding(.top,30)
                }
                
                NavigationLink(destination:RankingView()){
                    Text("ランキングをチェック")
                        .modifier(MyTitle(color: .orange, width: 250, height: 70))
                        .padding(.top,40)
                }
                
                
                
                Spacer()
                
                    .sheet(isPresented: $showingModal) {
                        QuestionView(isPresented: $showingModal)
                    }
                
            }
        }
    }
}
