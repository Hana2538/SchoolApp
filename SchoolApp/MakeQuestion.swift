import SwiftUI

struct MakeQuestion: View {
    var body: some View {
//        @Environment(\.dismiss) var dismiss
        VStack {
            
            Button("閉じる") {
//               dismiss()
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
