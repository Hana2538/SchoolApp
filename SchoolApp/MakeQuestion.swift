import SwiftUI

struct MakeQuestion: View {
    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("問題を新規作成")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .foregroundColor(Color.orange)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(red: 0, green: 0.4, blue: 0.7))
                        .frame(width: 350, height: 250)
                        .opacity(0.7)
                    
                    Text("ルームを作成")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.top, 100) 
                
                Spacer()
            }
        }
    }
}

#Preview {
    MakeQuestion()
}
