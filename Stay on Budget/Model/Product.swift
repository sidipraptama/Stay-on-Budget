//
//  Product.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 30/04/24.
//

import Foundation

struct Product: Codable {
    var id: Int
    var title: String
    var description: String
    var price: Double
    var discountPercentage: Double
    var rating: Double
//    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
}

struct ProductResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

//"id": 1,
//"title": "iPhone 9",
//"description": "An apple mobile which is nothing like apple",
//"price": 549,
//"discountPercentage": 12.96,
//"rating": 4.69,
//"stock": 94,
//"brand": "Apple",
//"category": "smartphones",
//"thumbnail": "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
//"images": [
//  "https://cdn.dummyjson.com/product-images/1/1.jpg",
//  "https://cdn.dummyjson.com/product-images/1/2.jpg",
//  "https://cdn.dummyjson.com/product-images/1/3.jpg",
//  "https://cdn.dummyjson.com/product-images/1/4.jpg",
//  "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
//]
//},
