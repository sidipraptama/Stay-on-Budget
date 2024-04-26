//
//  homePage.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 26/04/24.
//

import SwiftUI

struct HomePageView: View {
    @Environment(Game.self) var game
    @State private var modelData = ModelData()
    @State private var isScoreActive = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                GeometryReader { proxy in
                    Image("square logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding([.bottom, .top], 20)
                        .position(.init(x: proxy.size.width / 2, y: proxy.size.height / 2 - 100))
                        .onAppear {
                            print(proxy.frame(in: .global).minY)
                        }
                }
                
                Spacer()
                Spacer()
                
                // Button Start Play
                NavigationLink{
                    InGameView()
                        .navigationBarBackButtonHidden()
                        .onAppear {
                            modelData.shuffleProducts()
                            game.playClick()
                            print("In Game View")
                        }
                        .environment(modelData)
                } label: {
                    PrimaryButton(text: "START PLAY")
                }
                .padding([.bottom], 10)
                
                // Button Scores
                Button {
                    isScoreActive.toggle()
                    game.playClick()
                } label: {
                    SecondaryButton(text: "SCORES")
                }
                
            }
            .padding([.top, .bottom], 80)
            .background(
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.5)
            )
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $isScoreActive, content: {
                ScoresView()
            })
        }
        .animation(.bouncy, value: 10)
    }
}

//#Preview {
//    HomePageView()
//}
