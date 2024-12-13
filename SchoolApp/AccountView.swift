import SwiftUI

struct AccountView: View {
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
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    AccountView()
}
