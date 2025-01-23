import SwiftUI

struct HomeView: View {
    @State private var GamePin: String = ""
    @State private var YourName: String = "アカウント名"
    var body: some View {
        NavigationView{
            ZStack {
                
                Image("kabegamiNone")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("\(YourName)")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                        .padding(.leading,200)
                        .padding(.top, 100)
                    
                    Text("Home")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                    
                    VStack{
                        TextField("ルームナンバー", text: $GamePin)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            .padding(.horizontal, 20)
                            .frame(width: 400, height: 50)
                            .padding(.bottom, 10)
                        
                        NavigationLink(destination:UserRoom()) {
                            Text("Go!!")
                                .modifier(MyTitle(color: Color(red: 0, green: 0.4, blue: 0.7), width: 200, height: 50))
                        }
                        
                        .padding(.bottom, 50)
                        
                        NavigationLink(destination:MakeRoomName()) { 
                            Text("問題を新規作成")
                                .modifier(MyTitle(color: .orange, width: 200, height: 50))
                        }
                        .padding(.bottom, 20)
                        
                        NavigationLink(destination:MyRoom()){
                            Text("My Room")
                                .modifier(MyTitle(color: .orange, width: 200, height: 50))
                        }
                        Spacer()
                        
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}
