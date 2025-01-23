import SwiftUI

struct QuestionView: View {
    @Binding var isPresented: Bool
    @State private var inputText: String = "問題文"
    @State private var choice1: String = "答え"
    @State private var choice2: String = "答え"
    @State private var choice3: String = "答え"
    @State private var choice4: String = "答え"
    
    var body: some View {
        VStack {
            Spacer()
            Text("仮ルーム")
                .font(.system(size:40))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                .padding(.bottom,20)
            
            Text("問題")
                .font(.system(size:30))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                .padding(.trailing,300)
            
            Text("\(inputText)")
                .font(.system(size:17))
                .fontWeight(.bold)
                .padding(.bottom,20)
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 1, green: 1, blue: 0))
                    .frame(width: 350, height: 60)
                    .opacity(0.8)
                    .padding(.bottom,20)
                
                Text("\(choice1)")
                    .font(.system(size:20))
                    .fontWeight(.bold)
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orange)
                    .frame(width: 350, height: 60)
                    .opacity(0.8)
                    .padding(.bottom,20)
                
                Text("\(choice2)")
                    .font(.system(size:20))
                    .fontWeight(.bold)
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 0, green: 0.4, blue: 0.7))
                    .frame(width: 350, height: 60)
                    .opacity(0.8)
                    .padding(.bottom,20)
                
                Text("\(choice3)")
                    .font(.system(size:20))
                    .fontWeight(.bold)
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: 0, green: 0.3, blue: 0.6))
                    .frame(width: 350, height: 60)
                    .opacity(0.8)
                
                Text("\(choice4)")
                    .font(.system(size:20))
                    .fontWeight(.bold)
            }
            
            Spacer()
                
           
            }
        }
    }

