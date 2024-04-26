//
//  ResultView.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 29/04/24.
//

import SwiftUI

struct ResultView: View {
    @Environment(Game.self) var game
    @Environment(\.modelContext) var context
    
    private var ExpenseColor: Color {
        if (game.getBudget() < game.getExpense()) {
            .red
        } else {
            .black
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("vertical logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .padding(.vertical, 15)
                }
                .frame(width: 1000)
                .border(width: 2, edges: [.leading, .trailing, .bottom, .top], color: .black)
                
                HStack {
                    
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                HStack {
                    Text("• Budget:")
                        .font(.custom("SingleDay-Regular", size: 30))
                        .frame(maxWidth: 300, alignment: .leading)
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                HStack {
                    Text("$\(game.budget.formatted())")
                        .font(.custom("SingleDay-Regular", size: 45))
                        .bold()
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                HStack {
                    Text("• Expense:")
                        .font(.custom("SingleDay-Regular", size: 30))
                        .frame(maxWidth: 300, alignment: .leading)
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                HStack {
                    Text("$\(game.getExpense().formatted())")
                        .font(.custom("SingleDay-Regular", size: 45))
                        .foregroundColor(ExpenseColor)
                        .bold()
                        .animation(.bouncy(extraBounce: 10))
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                HStack {
                    if (game.getBudget() < game.getExpense()) {
                        Text("OVER BUDGET")
                            .font(.custom("SingleDay-Regular", size: 45))
                            .foregroundColor(.red)
                            .bold()
                            .animation(.bouncy(extraBounce: 10))
                    } else {
                        Text("ON BUDGET")
                            .font(.custom("SingleDay-Regular", size: 45))
                            .foregroundColor(.black)
                            .bold()
                            .animation(.bouncy(extraBounce: 10))
                            .onAppear{
                                context.insert(HighScoreModel(Date: Date.now, Score: game.getExpense()))
                            }
                    }
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                
                HStack {
                    
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                HStack {
                    
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                
                HStack {
                    NavigationLink {
                        HomePageView()
                            .navigationBarBackButtonHidden()
                            .onAppear {
                                game.playClick()
                                game.resetGame()
                            }
                    } label: {
                        PrimaryButton(text: "BACK TO HOME")
                            .padding(.top, 5)
                            .padding(.bottom, 15)
                    }
                }
                .frame(width: 1000)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
            
                HStack {
                    
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
            }
            .transition(.scale)
        }
    }
}

struct ResultPreview : PreviewProvider {

    @State static var budget = 10000
    @State static var expense = 12000

    static var previews: some View {
        ResultView()
    }

}
