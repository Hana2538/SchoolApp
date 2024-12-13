import SwiftUI

struct AccountView: View {
    @State var imageName: String = "kabegamiNone"
    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("アカウント編集")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                
//                Spacer()
                
                Image(imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200,height: 200)
                
                Spacer()
                
                Text("アカウント名を編集")
                    .font(.system(size:30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red:0,green:0.4,blue:0.7))
                
            }
            .padding(.top,30)
        }
    }
}

#Preview {
    AccountView()
}
