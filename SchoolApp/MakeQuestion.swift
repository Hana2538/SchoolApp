import SwiftUI

struct MakeQuestion: View {
    @Binding var isPresented: Bool
    @State private var  roomname: String = ""

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
                
                TextField("", text: $roomname)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .frame(width: 350, height: 50)
                    .padding(.bottom, 30)
                
                Spacer()
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .padding(40)
    }
}
