import SwiftUI

struct MyRoom: View {
    var body: some View {
        
        ZStack{
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                Text("My Room")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination:SubjectRoom()){
                    Text("仮ルーム")
                        .modifier(MyTitle(color: .orange))
                    
                }
                Spacer()
                
                
            }
        }
    }
}
