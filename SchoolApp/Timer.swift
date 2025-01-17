import SwiftUI

struct Timer: View{
    var body: some View{
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                Text("Timer")
                    .font(.system(size:50))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(width: 350, height: 120)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                
                Spacer()
                
            }
        }
    }
}
