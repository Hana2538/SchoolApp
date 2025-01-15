import SwiftUI

struct Answer: View {
    @Binding var choice1: String
    @Binding var choice2: String
    @Binding var choice3: String
    @Binding var choice4: String
    
    @State private var isChoice1Selected = false
    @State private var isChoice2Selected = false
    @State private var isChoice3Selected = false
    @State private var isChoice4Selected = false
    
    

    var body: some View {
            
            
            ZStack {
                VStack {
                    Text("問題を作成")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .multilineTextAlignment(.center)

                    Text("正解の選択肢を選んでください")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Toggle(isOn: $isChoice1Selected) {
                                Text("選択肢1: \(choice1)")
                                    .font(.system(size: 25))
                            }
                            .toggleStyle(CheckBoxToggleStyle())
                        }
                        .padding(.bottom, 20)
                        
                        HStack {
                            Toggle(isOn: $isChoice2Selected) {
                                Text("選択肢2: \(choice2)")
                                    .font(.system(size: 25))
                            }
                            .toggleStyle(CheckBoxToggleStyle())
                        }
                        .padding(.bottom, 20)
                        
                        HStack {
                            Toggle(isOn: $isChoice3Selected) {
                                Text("選択肢3: \(choice3)")
                                    .font(.system(size: 25))
                            }
                            .toggleStyle(CheckBoxToggleStyle())
                        }
                        .padding(.bottom, 20)
                        
                        HStack {//HStackは横に配置するためのことらしい！
                            Toggle(isOn: $isChoice4Selected) {
                                Text("選択肢4: \(choice4)")
                                    .font(.system(size: 25))
                            }
                            .toggleStyle(CheckBoxToggleStyle())
                        }
                        .padding(.bottom, 20)
                    }

                    Spacer()
                }
                .padding(20)
                
                NavigationLink(destination: PointView()) {
                    Text("次へ")
                        .modifier(MyTitle(color: .orange))
                
                
            }
        }
    }
}

struct CheckBoxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")//ここでONの時とOffの時での状態を書いてる！前者はチェックマーク付きだからON！
                .resizable()//フレキシブルになってるね
                .scaledToFit()//こっちは枠に収められるようにしてるらしい
                .frame(width: 24, height: 24)
                .onTapGesture {//タップした時って言ってる
                    configuration.isOn.toggle()//ここでON／OFFごとの状態を切り替えてる！つまりisOnを切り替えてるんだね
                }
        }
    }
}
