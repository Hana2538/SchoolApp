import SwiftUI

struct Timer: View{
    @State private var Hour = 0
    @State private var Minutes = 0
    @State private var Second = 0
    var body: some View{
        
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                
                
                Text("Timer")
                    .font(.system(size:50))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                ZStack {
                    Circle()
                        .stroke(
                            Color.orange,
                            style: StrokeStyle(
                                lineWidth: 30, // 線の太さ
                                lineCap: .round) // 線の端の形
                        )
                        .frame(width: 280, height: 280)
                    Circle()
                        .trim(from: 0.0, to: 0.5) //どっからどこまでいくかだよん
                        .stroke(
                            Color(red: 0, green: 0.4, blue: 0.7),
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round)
                        )
                        .frame(width: 280, height: 280)
                    
                    HStack{
                        Picker(selection: $Second, label: Text("時間選択")) {
                            ForEach(1 ..< 59) { num in
                                Text(String(num))
                                    .font(.system(size: 35))
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .scaleEffect(1.2)
                        .frame(width: 80, height: 150)
                        
                        Picker(selection: $Minutes, label: Text("分選択")) {
                            ForEach(1 ..< 59) { num in
                                Text(String(num))
                                    .font(.system(size: 35))
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .scaleEffect(1.2)
                        .frame(width: 80, height: 150)

                        Picker(selection: $Second, label: Text("秒選択")) {
                            ForEach(1 ..< 59) { num in
                                Text(String(num))
                                    .font(.system(size: 35))
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .scaleEffect(1.2)
                        .frame(width: 80, height: 150)
                    }
                        
                    }
                }
                
                Spacer()
                
            }
        }
    }

