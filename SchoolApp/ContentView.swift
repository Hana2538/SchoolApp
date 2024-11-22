import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("welcome")
                .font(.system(size: 50))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
                .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
            Spacer().frame(height: 40)
            
            Text("ログイン")
                            .font(.system(size: 30))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                        
                        Spacer() // 残りスペースを下に配置
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
