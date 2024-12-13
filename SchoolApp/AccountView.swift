import SwiftUI

struct AccountView: View {
    @State var imageName: String = "kabegamiNone"
    @State private var accountname: String = ""
    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("Edit Account")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                
                    
                
                Image(imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200,height: 200)
                

                TextField("アカウント名を編集", text: $accountname)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                    .frame(width: 400, height: 50)
                
                Spacer()
                
            }
            .padding(.top,30)
        }
    }
}

#Preview {
    AccountView()
}
