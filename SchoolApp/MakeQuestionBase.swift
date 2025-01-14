import SwiftUI

struct MakeQuestionBase: View {
    @State private var showingModal = false
    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    //スクロール可能な部分だよん
                    Spacer()
                    
                    
                    Button(action: {
                        showingModal.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0, green: 0.4, blue: 0.7))
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                            .padding(.leading, 250)
                    
                    // モーダルシート
                    .sheet(isPresented: $showingModal) {
                        MakeQuestion()
                    }
                }
                
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: MyRoom()) {
                        Text("ゲームPINを作成")
                            .modifier(MyTitle(color: .orange))
                    }
                    .padding(.top, 500)
                }
            }
        }
    }
}
