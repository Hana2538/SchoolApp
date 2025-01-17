import SwiftUI

struct Timer: View{
    var body: some View{
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                
                
                Text("Timer")
                    .font(.system(size:50))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                ZStack {
                            Circle()
                                .stroke(
                                    Color.gray,
                                    style: StrokeStyle(
                                        lineWidth: 15, // 線の太さ
                                        lineCap: .round) // 線の端の形
                                )
//                                .opacity(0.5)
                                .frame(width: 300, height: 300)
                            // 上の円
                            Circle()
                                .trim(from: 0.0, to: 0.5) //ビヨーンてなる線
                                .stroke(
                                    Color(red: 0, green: 0.4, blue: 0.7),
                                    style: StrokeStyle(
                                        lineWidth: 15,
                                        lineCap: .round)
                                )
                                .frame(width: 300, height: 300)
                        }
                
                Spacer()
                
            }
        }
    }
}
