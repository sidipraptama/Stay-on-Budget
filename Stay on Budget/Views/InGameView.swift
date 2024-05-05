//
//  InGameView.swift
//  Stay on Budget
//
//  Created by Sidi Praptama Aurelius Nurhalim on 26/04/24.
//

import SwiftUI
import AudioToolbox

struct InGameView: View {
    @Environment(Game.self) var game
    @Environment(ModelData.self) var modelData
    @Environment(\.dismiss) var dismiss
    @State var isOverBudget: Bool = false
    @State var isInPause = false
    @State var isCancelStart = false
    @State var isStart = false
    @State var isExit = false
    @State var isCheckout = false
    @State var isConfirm = false
    @State private var isStartActive = true
    @State private var isBackActive = false
    @State private var isInfoActive = false
    @State private var isConfirmEndActive = false
    @State private var currentIndex = 2 // State untuk mengontrol indeks item yang ditampilkan
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollViewReader { scrollViewProxy in
                    ScrollView (.vertical, showsIndicators: true) {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100)), GridItem(.flexible())], alignment: .center, spacing: 15) {
                            ForEach(0..<modelData.products.count, id:\.self) { index in
                                CardView(product: self.modelData.products[index])
                                .id(index) // Memberi ID pada setiap CardView
                                .onAppear {
                                    // Jika CardView yang terlihat adalah Card yang sesuai dengan `currentIndex`, gulir ke atas
                                    if index == currentIndex {
                                        scrollViewProxy.scrollTo(index, anchor: .top)
                                    }
                                }
                            }
                        }
                        .padding([.leading, .trailing])
                        .onChange(of: currentIndex) { newValue, oldValue in
                            if newValue != oldValue {
                                withAnimation {
                                    scrollViewProxy.scrollTo(newValue, anchor: .top)
                                }
                            }
                        }
                        
                    }
                    .scrollDisabled(true)
//                    .simultaneousGesture(DragGesture(minimumDistance: 0), including: .all)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                isBackActive.toggle()
                                game.playClick()
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
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isInfoActive.toggle()
                                game.playClick()
                            } label: {
                                Image(systemName: "book.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 22)
                                    .padding([.trailing], 10)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .border(width: 2, edges: [.top], color: .black)
                    .navigationBarTitleDisplayMode(.inline)
                    .padding([.top], 15)
                    
                    HStack {
                        Button(action: {
                            game.playClick()
                            isConfirmEndActive.toggle()
                        }) {
                            ZStack{
                                HStack {
                                    Text("CHECKOUT (\(self.game.getCountProducts()))")
                                        .font(.custom("SingleDay-Regular", size: 20))
                                        .padding(.trailing, 5)
                                    Image(systemName: "cart.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 17)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                            }.overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(self.game.getCountProducts() > 0 ? .black : .gray, lineWidth: 3)
                            )
                            .background(self.game.getCountProducts() > 0 ? .black : .gray)
                            .cornerRadius(50)
                            .padding([.leading], 15)
                        }
                        .disabled(game.products.count <= 0 ? true : false)
                        
                        Button(action: {
                            game.playClick()
                            if currentIndex < 100 {
                                currentIndex = (currentIndex + 2)
                            }
                            print(currentIndex)
                        }) {
                            ZStack{
                                HStack {
                                    Text("NEXT PAGE")
                                        .font(.custom("SingleDay-Regular", size: 20))
                                        .padding(.trailing, 5)
                                    Image(systemName: "arrowtriangle.down")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 15)
                                }
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(8)
                            }.overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .background(.white)
                            .cornerRadius(50)
                            .padding([.trailing], 15)
                        }
                    }
                    .padding(.top)
                    .border(width: 2, edges: [.top], color: .black)
                }
            }
            .fullScreenCover(isPresented: $isBackActive, content: {
                PauseModalView(isExit: $isExit)
                    .onDisappear(perform: {
                        if isExit == true {
                            print("Exit")
                            dismiss()
                        }
                    })
                    .presentationBackground(.black.opacity(0.2))
            })
            .fullScreenCover(isPresented: $isInfoActive, content: {
                InfoModalView()
                    .presentationBackground(.black.opacity(0.2))
            })
            .fullScreenCover(isPresented: $isConfirmEndActive, content: {
                ConfirmEndModalView(isConfirm: $isConfirm)
                    .onDisappear(perform: {
                        if isConfirm == true {
                            isCheckout = true
                        }
                    })
                    .presentationBackground(.black.opacity(0.2))
            })
            .fullScreenCover(isPresented: $isStartActive, content: {
                withAnimation(.easeIn(duration: 0.5).delay(5)) {
                    StartModalView(isStart: $isStart, isCancelStart: $isCancelStart)
                        .onDisappear(perform: {
                            if (isCancelStart == true && isStart == false) {
                                print("Cancel Start")
                                dismiss()
                            }
                            else if (isCancelStart == false && isStart == true) {
                                print("Start")
                            }
                        })
                        .presentationBackground(.black.opacity(0.2))
                        .transition(.scale)
                }
            })
            .fullScreenCover(isPresented: $isCheckout, content: {
                withAnimation(.easeIn(duration: 3.0).delay(2)) {
                    ResultView()
                        .onAppear {
                            game.playKerching()
                            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {}
//                            let impactMed = UIImpactFeedbackGenerator(style: .heavy)
//                            impactMed.impactOccurred(intensity: 1)
                        }
//                        .presentationBackground(.white)
                }
            })
        }
    }
}


//struct BindingViewExample_2_Previews : PreviewProvider {
//
//    @State static var budget = 10000
//    @State static var time = 60
//
//    static var previews: some View {
//        InGameView(budget: $budget, time: $time)
//    }
//
//}
