//
//  SplashView.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 03/05/24.
//

import SwiftUI
import AVFoundation

struct SplashView: View {
    @Environment(NetworkMonitor.self) var networkMonitor
    @Environment(Game.self) var game
    @State var isSplashActive: Bool = true
    @State var offset = CGFloat(0)
    
    var body: some View {
        ZStack{
            if self.isSplashActive || !networkMonitor.isConnected {
                VStack {
                    Spacer()
                    GeometryReader { proxy in
                        Image("square logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                            .padding([.bottom, .top], 20)
                            .position(.init(x: proxy.size.width / 2, y: proxy.size.height / 2))
                            .offset(y: offset)
                    }
                    Spacer()
                    
                }
                .padding([.top, .bottom], 80)
                .background(
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.5)
                )
                .edgesIgnoringSafeArea(.all)
            }
            else
            {
                HomePageView()
                    .onAppear {
                        game.playBGMusic()
                    }
            }
        }
        .onAppear {
            if networkMonitor.isConnected {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.spring(duration: 0.375)) {
                        game.playKerching()
                        offset = CGFloat(-169)
                    } completion: {
                        withAnimation {
                            self.isSplashActive = false
                        }
                    }
                }
            }
        }
        .onChange(of: networkMonitor.isConnected, {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring(duration: 0.375)) {
                    game.playKerching()
                    offset = CGFloat(-169)
                } completion: {
                    withAnimation {
                        self.isSplashActive = false
                    }
                }
            }
        })
    }
}

//#Preview {
//    SplashView()
//}
