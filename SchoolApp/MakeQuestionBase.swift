import SwiftUI

struct MakeQuestionBase: View {
    @State private var showingSheet = false

    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    // スクロール可能な部分
                    Spacer()
                }
            }
            
           
            VStack {
                Spacer()

                Button(action: {
                    self.showingSheet.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 0, green: 0.4, blue: 0.7))
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                .padding(.bottom, 30) 
                .sheet(isPresented: $showingSheet) {
                    MakeQuestion()
                }
            }
        }
    }
}
