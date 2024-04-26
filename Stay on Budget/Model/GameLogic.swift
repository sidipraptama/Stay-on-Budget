//
//  GameLogic.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 30/04/24.
//

import Foundation
import AVFoundation

@Observable
class Game {
    var musicVolume: Float = 3
    var playerMusic: AVAudioPlayer?
    var playerSFX: AVAudioPlayer?
    var budget: Double = 10000
    var time: Int = 60
    var products: [Product] = []

//    init(budget: Int, time: Int) {
//        self.budget = budget
//        self.time = time
//        self.expense = 0
//    }
    
    func playClick() {
        guard let path = Bundle.main.path(forResource: "click", ofType: ".mp3") else {
          return
        }
          
          let url = URL(fileURLWithPath: path)

        do {
            self.playerSFX = try AVAudioPlayer(contentsOf: url)
            self.playerSFX?.currentTime = 0
            self.playerSFX?.volume = 3
            self.playerSFX?.play()
        } catch {
          print("Failed to load the sound: \(error)")
        }
        playerSFX?.play()
    }
    
    func playKerching() {
        guard let path = Bundle.main.path(forResource: "kerching", ofType: ".mp3") else {
          return
        }
          
          let url = URL(fileURLWithPath: path)

        do {
            self.playerSFX = try AVAudioPlayer(contentsOf: url)
            self.playerSFX?.currentTime = 0
            self.playerSFX?.volume = 3
            self.playerSFX?.play()
        } catch {
          print("Failed to load the sound: \(error)")
        }
        playerSFX?.play()
    }
    
    func playBGMusic() {
      guard let path = Bundle.main.path(forResource: "background music (2)", ofType: ".mp3") else {
        return
      }
        
        let url = URL(fileURLWithPath: path)

      do {
          self.playerMusic = try AVAudioPlayer(contentsOf: url)
          self.playerMusic?.numberOfLoops = -1 // Loop indefinitely
          self.playerMusic?.currentTime = 0
          self.playerMusic?.volume = musicVolume
          self.playerMusic?.play()
      } catch {
        print("Failed to load the sound: \(error)")
      }
      playerMusic?.play()
    }
    
    func getBudget() -> Double {
        return self.budget
    }
    
    func getTime() -> Int {
        return self.time
    }

    func getProducts() -> [Product] {
        return self.products
    }
    
    func getProduct(id: Int) -> Product {
        return self.products[id]
    }
    
    func getExpense() -> Double {
        var totalExpense: Double = 0
        
        for product in products {
            totalExpense += product.price
        }
        
        return totalExpense
    }
    
    func getCountProducts() -> Int {
        return products.count
    }
    
    func resetGame() {
        print("Reset Game")
        self.budget = 10000
        self.time = 60
        self.products = []
    }
    
    func appendProduct(product: Product) {
        self.products.append(product)
    }
}


