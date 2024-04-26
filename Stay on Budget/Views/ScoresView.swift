//
//  ScoresView.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 26/04/24.
//

//
//  ResultView.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 29/04/24.
//

import SwiftUI
import SwiftData

struct ScoresView: View {
    @Environment(Game.self) var game
    @Environment(\.dismiss) var dismiss
    @Query(sort: \HighScoreModel.Score, order: .reverse) var highscores: [HighScoreModel]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                HStack {
                    Text("High Scores:")
                        .font(.custom("SingleDay-Regular", size: 45))
                        .bold()
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                if !highscores.isEmpty {
                    ForEach(0..<5, id: \.self) { index in
                            HStack {
                                if highscores.count > index && highscores.count > 0 {
                                    Text("\(index + 1). $\(highscores[index].Score.formatted())")
                                        .font(.custom("SingleDay-Regular", size: 38))
                                }
                            }
                            .frame(width: 1000, height: 50)
                            .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                        
                    }
                } 
                else {
                    ForEach(0..<5, id: \.self) { index in
                        HStack {
                            
                        }
                        .frame(width: 1000, height: 50)
                        .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                        
                    }
                }

                HStack {
                    
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
                    
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
                
                HStack {
                    
                }
                .frame(width: 1000, height: 50)
                .border(width: 2, edges: [.leading, .trailing, .bottom], color: .black)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        game.playClick()
                        dismiss()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 22)
                            .padding([.leading], 10)
                            .foregroundColor(.black)
                    }
                }
                
                ToolbarItemGroup (placement: .principal) {
                    Image("vertical logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100)
                }
            }
            .border(width: 2, edges: [.top], color: .black)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct ScoresPreview : PreviewProvider {
//
//    @State static var scores = [1000, 2000, 3000, 2400, 6000]
//
//    static var previews: some View {
//        ScoresView(scores: $scores)
//    }
//
//}
