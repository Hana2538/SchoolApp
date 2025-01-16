import SwiftUI

struct SubjectRoom: View{
    var body: some View{
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Text("仮ルーム")
                    .font(.system(size:45))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination:MakeQuestionBase()){
                    Text("問題を編集")
                        .modifier(MyTitle(color:.orange))
                }
                
                Spacer()
            }
        }
    }
}
