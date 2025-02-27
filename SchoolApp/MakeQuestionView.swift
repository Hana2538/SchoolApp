import SwiftUI

struct TextFieldStyleView: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 2)
            )
            .frame(width: 340, height: 50)
            .padding(.bottom,20)
    }
}

extension View {
    func customTextFieldStyle(color: Color = .white) -> some View {
        self.modifier(TextFieldStyleView(color: color))
    }
}



struct MakeQuestionView: View {
    @StateObject private var viewModel = MakeQuestionViewModel() // ViewModelをインスタンス化
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
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
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextEditor(text: $viewModel.questionText)
                        .padding(10)
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
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("選択肢1", text: $viewModel.choice1)
                        .customTextFieldStyle(color: .white)
                    
                    TextField("選択肢2", text: $viewModel.choice2)
                        .customTextFieldStyle(color: .white)
                    
                    TextField("選択肢3", text: $viewModel.choice3)
                        .customTextFieldStyle(color: .white)
                    
                    TextField("選択肢4", text: $viewModel.choice4)
                        .customTextFieldStyle(color: .white)
                    
                    // 「次へ」ボタンでAnswerViewに遷移
                    NavigationLink(destination: AnswerView(
                        choice1: $viewModel.choice1,
                        choice2: $viewModel.choice2,
                        choice3: $viewModel.choice3,
                        choice4: $viewModel.choice4,
                        isPresented: $isPresented,
                        viewModel: viewModel)) {
                        Text("次へ")
                            .modifier(MyTitle(color: .orange, width: 200, height: 50))
                    }
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .padding(40)
        }
    }
}




