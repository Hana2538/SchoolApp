import SwiftUI

struct MakeQuestion: View {
    var body: some View {
        VStack {
            Text("モーダルシートが表示されています")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("閉じる") {
                // モーダルを閉じるアクション
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
