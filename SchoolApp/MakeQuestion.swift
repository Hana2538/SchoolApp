import SwiftUI // これが必要です

struct MakeQuestion: View { // 新しいビューの例
    var body: some View {
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                
            }
        }
        
    }
}

#Preview {
    MakeQuestion()
}
