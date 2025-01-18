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
                            
                            Spacer()
                            
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
                        
                        HStack {
                            
                            Spacer()
                            
                            ZStack {
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                                
                                
                                Text("2")
                                    .font(.system(size: 35))
                                    .foregroundColor(Color(red: 0, green: 0.4, blue: 0.7))
                                
                            }
                            Spacer()
                        }
                        
                        HStack {
                            
                            Spacer()
                            
                            ZStack {
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(Color(red: 0.6, green: 0.4, blue: 0.2))
                                
                                
                                Text("3")
                                    .font(.system(size: 35))
                                    .foregroundColor(Color.white)
                                
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
