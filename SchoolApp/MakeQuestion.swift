import SwiftUI

struct MakeQuestion: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Button("閉じる") {
                isPresented = false
                print("閉じるボタンが押された")
            }
            .font(.title)
            .foregroundColor(.orange)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .padding(40)
    }
}
