import SwiftUI

struct RankingView: View {
    var body: some View {
        ZStack {
            Image("kabegamiNone")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                
                Text("Ranking")
                    .font(.system(size:50))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                
                ScrollView {
                    VStack {
                        
                        
                        HStack {
                            ZStack {
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.yellow)
                                
                                
                                Text("1")
                                    .font(.system(size: 35))
                                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                                
                            }
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
}
