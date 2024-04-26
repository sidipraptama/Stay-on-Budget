//
//  CardView.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 28/04/24.
//

import SwiftUI

struct CardView: View {
    @Environment(Game.self) var game
    @Environment(ModelData.self) var modelData
    @State var isClicked: Bool = false
    let product: Product
    let cardAndImageWidth: CGFloat = 170
    let cardHeight: CGFloat = 300
    let imageHeight: CGFloat = 170
    let cornerRadius: CGFloat = 5
    
    private var truncatedTitle: String {
        if product.title.count > 15 {
            return String(product.title.prefix(15)) + "..."
        } else {
            return product.title
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(SwiftUI.Color.gray, lineWidth: 1)
                .frame(width: cardAndImageWidth, height: cardHeight)
                .background(SwiftUI.Color.white)
            VStack(alignment: .center, spacing: 10) {
//                AsyncImage(url: URL(string: "\(imageURL)"))
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: cardAndImageWidth, height: imageHeight)
//                    .clipped()
                AsyncImage(url: URL(string: "\(self.product.images[0])")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: cardAndImageWidth - 2, height: imageHeight - 2, alignment: .center)
                        .clipped()
                } placeholder: {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Loading...")
                            .font(.custom("SingleDay-Regular", size: 12))
                        Spacer()
                    }
                    Spacer()
                }
                .offset(y: +2)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(product.category)")
                        .font(.custom("SingleDay-Regular", size: 15))
                        .foregroundColor(SwiftUI.Color.gray)
                    Text("\(truncatedTitle)")
                        .font(.custom("SingleDay-Regular", size: 18))
                        .fontWeight(.bold)
                    Text("$\(product.price.formatted())")
                        .font(.custom("SingleDay-Regular", size: 30))
                        .padding([.top], 10)
                    Button(action: {
                        game.playClick()
                        game.products.append(self.product)
                        isClicked.toggle()
                        // heptic feedback
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    }, label: {
                        AddToCart(isClicked: $isClicked, text: "Add to cart")
                    })
                    .padding([.top], 5)
                    .disabled(isClicked)
                }
                .padding(.horizontal,12)
                .padding(.bottom,11)
                Spacer()
            }
            .frame(width: cardAndImageWidth, height: cardHeight)
            .cornerRadius(cornerRadius)
        }
    }
}

//#Preview {
//    CardView()
//}
