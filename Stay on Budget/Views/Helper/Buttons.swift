//
//  Buttons.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 26/04/24.
//

import SwiftUI

struct AddToCart: View {
    @Binding var isClicked: Bool
    var text: String
    
    var body: some View {
        ZStack{
            HStack {
                Spacer()
                Text(text)
                    .font(.custom("SingleDay-Regular", size: 18))
                    .bold()
                    .foregroundColor(.white)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                Spacer()
            }
            .padding([.bottom, .top], 5)
            .frame(maxWidth: .infinity)
        }.overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(isClicked ? Color.gray : Color.black, lineWidth: 3)
        )
        .background(isClicked ? Color.gray : Color.black)
        .cornerRadius(50)
    }
}


struct PrimaryButton: View {
    var text: String
    
    var body: some View {
        ZStack{
            Text(text)
                .padding([.bottom, .top], 15)
                .font(.custom("SingleDay-Regular", size: 25))
                .bold()
                .frame(width: 200)
                .foregroundColor(.white)
        }.overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(.black, lineWidth: 3)
        )
        .background(.black)
        .cornerRadius(50)
    }
}

struct SecondaryButton: View {
    var text: String
    
    var body: some View {
        ZStack{
            Text(text)
                .padding([.bottom, .top], 15)
                .font(.custom("SingleDay-Regular", size: 25))
                .bold()
                .frame(width: 200)
                .foregroundColor(.black)
        }.overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(.black, lineWidth: 3)
        )
        .background(.white)
        .cornerRadius(50)
    }
}

//#Preview {
//    AddToCart(text: "Add to cart")
////    PrimaryButton(text: "START PLAY")
////    SecondaryButton(text: "SCORES")
//}
