import SwiftUI

struct MakeQuestion: View {
    @Binding var isPresented: Bool
    @State private var  roomname: String = ""
    @State private var imputText: String = ""

    var body: some View {
        ZStack {
           
            VStack {
                Text("問題を作成")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)

                Text("問題")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                    .frame(maxWidth: .infinity, alignment: .leading)//右寄せの時は.trailingだよ！
                
                TextEditor(text: $imputText)//「問題文を入力」って入れたいなぁ
                    .padding(10)//どうしてこれを追加したら角の掠れがなくなったんだろう
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .frame(width: 300, height: 150)
                
                Text("回答")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
                    .frame(maxWidth: .infinity, alignment: .leading)

                
                Spacer()
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .padding(40)
    }
}
