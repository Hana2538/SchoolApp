import SwiftUI

struct Timer: View {
    @State private var Hour = 0
    @State private var Minutes = 0
    @State private var Second = 0

    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("Timer")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                
                ZStack {
                    Circle()
                        .stroke(
                            Color.orange,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )
                        .frame(width: 280, height: 280)
                    
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .stroke(
                            Color(red: 0, green: 0.4, blue: 0.7),
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round//線の端の形
                            )
                        )
                        .frame(width: 280, height: 280)
                    
                    Text("")
                }

                Spacer()

                HStack {
                    Picker(selection: $Hour, label: Text("時間選択")) {
                        ForEach(0..<24) { num in
                            Text("\(num)").font(.system(size: 35))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .scaleEffect(1.2)
                    .frame(width: 80, height: 150)
                    
                    Text("h")
                        .font(.system(size:40))
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    
                    Picker(selection: $Minutes, label: Text("分選択")) {
                        ForEach(0..<60) { num in
                            Text("\(num)").font(.system(size: 35))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .scaleEffect(1.2)
                    .frame(width: 80, height: 150)
                    
                    Text("m")
                        .font(.system(size:40))
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    
                    Picker(selection: $Second, label: Text("秒選択")) {
                        ForEach(0..<60) { num in
                            Text("\(num)").font(.system(size: 35))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .scaleEffect(1.2)
                    .frame(width: 80, height: 150)
                    
                    Text("s")
                        .font(.system(size:40))
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                }
                .padding(.bottom,50)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        print("STARTボタンが押されました")
                    }) {
                        Text("START")
                            .modifier(MyTitle(color: .orange, width: 100, height: 50))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("STOPボタンが押されました")
                    }) {
                        Text("STOP")
                            .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 100, height: 50))
                    }

                    Spacer()
                }
                .padding(.bottom, 50) // ボタンの下に余白を追加

            }
        }
    }
}
