import SwiftUI

struct MakeQuestion: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Button("閉じる") {
                dismiss() // dismiss()を正しく呼び出す
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
