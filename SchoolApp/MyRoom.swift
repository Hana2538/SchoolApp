import SwiftUI

struct MyRoom: View {
    var body: some View {
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                Text("My Room")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding(.bottom,700)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                
            }
        }
    }
}
