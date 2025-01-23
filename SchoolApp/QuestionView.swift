import SwiftUI

struct QuestionView: View {
    @Binding var isPresented: Bool
    @State private var inputText: String = "問題文"
    
    var body: some View {
        VStack {
            Text("仮ルーム")
                .font(.system(size:40))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                .padding(.bottom,20)
            
            Text("問題")
                .font(.system(size:25))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                .padding(.trailing,300)
            
            Text("\(inputText)")
            
            
            Spacer()
                
           
            }
        }
    }

