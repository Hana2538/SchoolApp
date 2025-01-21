import SwiftUI

struct QuestionView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Question View")
                .font(.title)
                .padding()
            
            Button("閉じる") {
                isPresented = false
            }
        }
    }
}
