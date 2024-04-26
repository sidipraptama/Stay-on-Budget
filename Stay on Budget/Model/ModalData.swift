//
//  Products.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 30/04/24.
//

import Foundation

@Observable
class ModelData {
    var products: [Product] = []
    
    init() {
        self.fetchProducts()
    }
    
    func shuffleProducts() {
        self.products = self.products.shuffled()
    }

    func fetchProducts() {
        guard let url = URL(string: "https://dummyjson.com/products?limit=100") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(ProductResponse.self, from: data)
                DispatchQueue.main.async {
                    self.products = decodedData.products
                    self.products = self.products.shuffled()
                    print("Total products fetched: \(self.products.count)")
//                    print(self.products)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
