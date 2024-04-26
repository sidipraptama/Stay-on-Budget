//
//  HighScoresModel.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 30/04/24.
//

import Foundation
import SwiftData

@Model
class HighScoreModel {
    var Date: Date
    var Score: Double
    
    init(Date: Date, Score: Double) {
        self.Date = Date
        self.Score = Score
    }
}
