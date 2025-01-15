import SwiftUI

struct TextFieldStyle: ViewModifier {
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
        self.modifier(TextFieldStyle(color: color))
    }
}


struct MakeQuestion: View {
    @Binding var isPresented: Bool
    @State private var inputText: String = ""
    @State private var choice1: String = ""
    @State private var choice2: String = ""
    @State private var choice3: String = ""
    @State private var choice4: String = ""

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

                    TextEditor(text: $inputText)
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

                    TextField("選択肢1", text: $choice1)
                        .customTextFieldStyle(color: .white)

                    TextField("選択肢2", text: $choice2)
                        .customTextFieldStyle(color: .white)

                    TextField("選択肢3", text: $choice3)
                        .customTextFieldStyle(color: .white)

                    TextField("選択肢4", text: $choice4)
                        .customTextFieldStyle(color: .white)

                    NavigationLink(destination: Answer(choice1: $choice1, choice2: $choice2, choice3: $choice3, choice4: $choice4)) {
                        Text("次へ")
                            .modifier(MyTitle(color: .orange))
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
