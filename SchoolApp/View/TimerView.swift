import SwiftUI

struct TimerView: View {
    @State private var Hour = 0
    @State private var Minutes = 0
    @State private var Second = 0
    @State private var HourScreen: String = "00"
    @State private var MinuteScreen: String = "00"
    @State private var SecondScreen: String = "00"
    
    @State private var timerActive = false
    @State private var timer: Timer?
    
    @State private var totalSeconds: Int = 1 
    @State private var remainingSeconds: Int = 1
    
    @State private var currentProgress: CGFloat = 1.0
    
    var progress: CGFloat {
        return CGFloat(remainingSeconds) / CGFloat(totalSeconds)
    }
    
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
                    // オレンジの円（枠）
                    Circle()
                        .stroke(
                            Color.orange,
                            style: StrokeStyle(lineWidth: 30, lineCap: .round)
                        )
                        .frame(width: 280, height: 280)
                    
                    // 青い円（プログレスバー）
                    Circle()
                        .trim(from: 0.0, to: currentProgress)
                        .stroke(
                            Color(red: 0, green: 0.4, blue: 0.7),
                            style: StrokeStyle(lineWidth: 30, lineCap: .round)
                        )
                        .frame(width: 280, height: 280)
                        .rotationEffect(.degrees(-90)) // 上から開始
                    
                    // 時間表示
                    Text("\(HourScreen):\(MinuteScreen):\(SecondScreen)")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
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
                        startTimer()
                    }) {
                        Text("START")
                            .modifier(MyTitle(color: .orange, width: 100, height: 50))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        stopTimer()
                        print("STOPボタンが押されました")
                    }) {
                        Text("STOP")
                            .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 100, height: 50))
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 50)
                
            }
        }
    }
    
    func startTimer() {
        if !timerActive && timer == nil {
            HourScreen = String(format: "%02d", Hour)
            MinuteScreen = String(format: "%02d", Minutes)
            SecondScreen = String(format: "%02d", Second)
            
            totalSeconds = (Hour * 3600) + (Minutes * 60) + Second
            remainingSeconds = totalSeconds
        }
        
        timerActive = true

        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if timerActive {
                    countDown()
                }
            }
        }
    }

    func stopTimer() {
        timerActive = false
    }
    
    func countDown() {
        if remainingSeconds > 0 {
            remainingSeconds -= 1
        } else {
            timer?.invalidate()
            timer = nil
            timerActive = false
            return
        }
        
        
        withAnimation(.linear(duration: 1.0)) {
            currentProgress = CGFloat(remainingSeconds) / CGFloat(totalSeconds)
        }
        
        let h = remainingSeconds / 3600
        let m = (remainingSeconds % 3600) / 60
        let s = remainingSeconds % 60
        
        HourScreen = String(format: "%02d", h)
        MinuteScreen = String(format: "%02d", m)
        SecondScreen = String(format: "%02d", s)
    }
}
