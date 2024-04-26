//
//  ModalView.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 28/04/24.
//

import SwiftUI

struct PauseModalView: View {
    @Environment(Game.self) var game
    @Environment(\.dismiss) var dismiss
    @Binding var isExit : Bool
    
    var body: some View {
        ZStack {
            VStack (spacing: 0){
                HStack {
                    Text("PAUSE")
                        .font(.custom("SingleDay-Regular", size: 40))
                        .bold()
                }
                .frame(minWidth: 300, minHeight: 80)
                .background(.white)
                .border(width: 2, edges: [.bottom, .leading, .trailing, .top], color: .black)
                
                HStack {
                    
                }
                .frame(minWidth: 300, minHeight: 50)
                .background(.white)
                .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
                
                HStack {
                    Button {
                        game.playClick()
                        dismiss()
                    } label: {
                        PrimaryButton(text: "RESUME")
                            .padding([.top, .bottom], 10)
                    }
                }
                .frame(minWidth: 300, minHeight: 50)
                .background(.white)
                .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
                
//                HStack {
//                    Button {
//                        game.resetGame()
//                        game.playClick()
//                    } label: {
//                        SecondaryButton(text: "RESTART")
//                            .padding([.top, .bottom], 10)
//                    }
//                }
//                .frame(minWidth: 300, minHeight: 50)
//                .background(.white)
//                .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
                
                HStack {
                    Button(action: {
                        game.playClick()
                        isExit = true
                        dismiss()
                    }, label: {
                        SecondaryButton(text: "EXIT")
                            .padding([.top, .bottom], 10)
                    })
                }
                .frame(minWidth: 300, minHeight: 50)
                .background(.white)
                .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
                
                HStack {
                    
                }
                .frame(minWidth: 300, minHeight: 50)
                .background(.white)
                .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            }
        }
    }
}

struct StartModalView: View {
    @Environment(Game.self) var game
    @Environment(\.dismiss) var dismiss
    @Binding var isStart: Bool
    @Binding var isCancelStart: Bool
    
    var body: some View {
        VStack (spacing: 0, content: {
            HStack {
                Image("vertical logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
            .frame(minWidth: 300, minHeight: 80)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing, .top], color: .black)
            
            HStack {
                
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                Text("Budget: $\(self.game.budget.formatted())")
                    .font(.custom("SingleDay-Regular", size: 30))
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            
            HStack {
                
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                Button {
                    game.playClick()
                    isCancelStart = false
                    isStart = true
                    dismiss()
                } label: {
                    PrimaryButton(text: "START")
                        .padding([.top, .bottom], 10)
                }
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                Button {
                    game.playClick()
                    isStart = false
                    isCancelStart = true
                    dismiss()
                } label: {
                    SecondaryButton(text: "BACK")
                        .padding([.top, .bottom], 10)
                }
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
        })
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        edges.map { edge -> Path in
            switch edge {
            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
            }
        }.reduce(into: Path()) { $0.addPath($1) }
    }
}

struct InfoModalView: View {
    @Environment(Game.self) var game
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (spacing: 0, content: {
            HStack {
                Text("INFO")
                    .font(.custom("SingleDay-Regular", size: 40))
                    .bold()
            }
            .frame(minWidth: 300, minHeight: 80)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing, .top], color: .black)
            
            HStack {
                
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                Text("Just don't, ")
                    .font(.custom("SingleDay-Regular", size: 30))
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                Text("OVER BUDGET!")
                    .font(.custom("SingleDay-Regular", size: 30))
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                Button {
                    game.playClick()
                    dismiss()
                } label: {
                    PrimaryButton(text: "BACK TO GAME")
                        .padding([.top, .bottom], 10)
                }
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
        })
    }
}

struct ConfirmEndModalView: View {
    @Environment(Game.self) var game
    @Environment(\.dismiss) var dismiss
    @Binding var isConfirm: Bool
    
    var body: some View {
        VStack (spacing: 0, content: {
            HStack {
                Text("ARE YOU SURE?")
                    .font(.custom("SingleDay-Regular", size: 40))
                    .bold()
            }
            .frame(minWidth: 300, minHeight: 80)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing, .top], color: .black)
            
            HStack {
                
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                Button {
                    game.playClick()
                    isConfirm = true
                    dismiss()
                } label: {
                    PrimaryButton(text: "CHECKOUT")
                        .padding([.top, .bottom], 10)
                }
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            HStack {
                Button {
                    game.playClick()
                    dismiss()
                } label: {
                    SecondaryButton(text: "BACK TO GAME")
                        .padding([.top, .bottom], 10)
                }
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
            
            
            HStack {
                
            }
            .frame(minWidth: 300, minHeight: 50)
            .background(.white)
            .border(width: 2, edges: [.bottom, .leading, .trailing], color: .black)
        })
    }
}

//#Preview {
//    ConfirmEndModalView()
//}

//#Preview {
//    StartModalView()
//}

//#Preview {
//    PauseModalView()
//}
