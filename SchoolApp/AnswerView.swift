import SwiftUI

struct AnswerView: View {
    @Binding var choice1: String
    @Binding var choice2: String
    @Binding var choice3: String
    @Binding var choice4: String
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: MakeQuestionViewModel // ViewModelを監視

//     各選択肢の選択状態を管理するための@State
    @State private var isChoice1Selected = false
    @State private var isChoice2Selected = false
    @State private var isChoice3Selected = false
    @State private var isChoice4Selected = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("正解の選択肢を選んでください")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                
                VStack(alignment: .leading) {
                    // チェックボックスで選択肢1を選んだ場合
                    Toggle(isOn: $isChoice1Selected) {
                        Text("選択肢1: \(choice1)")
                            .font(.system(size: 25))
                    }
                    .toggleStyle(CheckBoxToggleStyle())
                    .onChange(of: isChoice1Selected) { newValue in
                        // 選択された選択肢を正解として設定
                        if newValue {
                            viewModel.correctAnswer = choice1
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // チェックボックスで選択肢2を選んだ場合
                    Toggle(isOn: $isChoice2Selected) {
                        Text("選択肢2: \(choice2)")
                            .font(.system(size: 25))
                    }
                    .toggleStyle(CheckBoxToggleStyle())
                    .onChange(of: isChoice2Selected) { newValue in
                        if newValue {
                            viewModel.correctAnswer = choice2
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // チェックボックスで選択肢3を選んだ場合
                    Toggle(isOn: $isChoice3Selected) {
                        Text("選択肢3: \(choice3)")
                            .font(.system(size: 25))
                    }
                    .toggleStyle(CheckBoxToggleStyle())
                    .onChange(of: isChoice3Selected) { newValue in
                        if newValue {
                            viewModel.correctAnswer = choice3
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // チェックボックスで選択肢4を選んだ場合
                    Toggle(isOn: $isChoice4Selected) {
                        Text("選択肢4: \(choice4)")
                            .font(.system(size: 25))
                    }
                    .toggleStyle(CheckBoxToggleStyle())
                    .onChange(of: isChoice4Selected) { newValue in
                        if newValue {
                            viewModel.correctAnswer = choice4
                        }
                    }
                    .padding(.bottom, 20)
                }
                
                Spacer()
                
                // 次の画面へ遷移するボタン
                NavigationLink(destination: PointView(isPresented: $isPresented)) {
                    Text("次へ")
                        .modifier(MyTitle(color: .orange, width: 200, height: 50))
                }
            }
            .padding(20)
        }
    }
}

struct CheckBoxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    configuration.isOn.toggle() // ここでチェックマークの切り替え
                }
        }
    }
}
