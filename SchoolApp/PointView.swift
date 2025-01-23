import SwiftUI

//ピッカーっていうのがあるよ！ホイールピッカーとかね！

struct PointView: View {
    @State private var Point: String = ""
    @Binding var isOpen: Bool
    var body: some View {
        
        ZStack{
            VStack{
                Text("問題を作成")
                    .font(.system(size:30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,10)
                
                Text("この問題のポイントを決めてください")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack{
                    TextField("", text: $Point)
                        .padding()
                        .font(.system(size:50))
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.horizontal)
                        .frame(width: 200, height: 50)
                    
                    Text("pt")
                        .font(.system(size:50))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    
                }
                Spacer()
                
                Button(action: {
                    print("問題を作成ボタンが押されました")
                    isOpen = false
                }) {
                    Text("問題を作成")
                        .modifier(MyTitle(color: .orange, width: 200, height: 50))
                }
                
                Spacer()
                    
                }
                
                Spacer()
                
                
            }
        }
    }

