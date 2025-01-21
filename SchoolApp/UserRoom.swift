import SwiftUI

struct UserRoom: View{
    @State private var points: Int = 0
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

                
                Spacer()
                
            }
        }
    }
}
