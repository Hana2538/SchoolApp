import SwiftUI

struct HomeView: View {
    @State private var GamePin: String = ""
    var body: some View {
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                TextField("ゲームPIN", text: $GamePin)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                    .frame(width: 400, height: 50)
            }
        }
    }
}

#Preview {
    HomeView()
}
