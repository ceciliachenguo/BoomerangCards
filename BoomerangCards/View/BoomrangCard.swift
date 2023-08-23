//
//  BoomrangCard.swift
//  BoomerangCards
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI

struct BoomerangCard: View{
    @Binding var cards: [Card]
    
    // MARK: Gesture Properties
    @State var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View{
        GeometryReader{
            let size = $0.size
            
            ZStack{
                ForEach(cards.reversed()) { card in
                    let index = indexOf(card: card)
                    
                    SingleCardView(singleCard: card)
                        .scaleEffect(card.scale,anchor: card.isRotated ? .center : .top)
                        .rotation3DEffect(.init(degrees: 360), axis: (x: 0, y: 0, z: 1))
                        .offset(y: -offsetFor(index: index))
                        .offset(y: card.extraOffset)
                        .scaleEffect(scaleFor(index: index), anchor: .top)
                        .zIndex(card.zIndex)
                         // MARK: Moving Only Current Active Card
                        .offset(y: currentIndex == indexOf(card: card) ? offset : 0)
                }
            }
            .animation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: offset == .zero)
            .frame(width: size.width, height: size.height)
            .gesture(
                DragGesture(minimumDistance: 2)
                    .onChanged(onChanged(value:))
                    .onEnded(onEnded(value:))
            )
        }
    }
    
    @ViewBuilder
    func CardView(card: Card)->some View{
        // MARK: Your Custom View
        SingleCardView(singleCard: card)
            .blur(radius: 6.5)
    }
    
    // MARK: Gesture Calls
    func onChanged(value: DragGesture.Value){
        // For Saftey
        offset = currentIndex == (cards.count - 1) ? 0 : value.translation.height
    }
    
    func onEnded(value: DragGesture.Value){
        var translation = value.translation.height
        // Since We Only Need Negative
        translation = (translation < 0 ? -translation : 0)
        translation = (currentIndex == (cards.count - 1) ? 0 : translation)
        
        // MARK: Since Our Card Height = 220
        if translation > 110{
            // MARK: Doing Boomerang Effect And Updating Current Index
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)){
                // Applying Rotation And Extra Offset
                cards[currentIndex].isRotated = true
                // Give Slightly Bigger Than Card Height
                cards[currentIndex].extraOffset = -350
                cards[currentIndex].scale = 0.7
            }
            
            // After a Little Delay Resetting Gesture Offset And Extra Offset
            // Pushing Card into back Using ZIndex
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)){
                    cards[currentIndex].zIndex = -100
                    for index in cards.indices{
                        cards[index].extraOffset = 0
                    }
                    // MARK: Updating Current Index
                    if currentIndex != (cards.count - 1){
                        currentIndex += 1
                    }
                    offset = .zero
                }
            }
            
            // After Animation Completed Resetting Rotation And Scaling And Setting Proper ZIndex Value
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                for index in cards.indices{
                    if index == currentIndex{
                        // MARK: Placing The Card At Right Index
                        // NOTE: Since The Current Index is Updated +1 Previously
                        // So The Current Index Will be -1 Now
                        if cards.indices.contains(currentIndex - 1){
                            cards[currentIndex - 1].zIndex = ZIndex(card: cards[currentIndex - 1])
                        }
                    }else{
                        cards[index].isRotated = false
                        withAnimation(.linear){
                            cards[index].scale = 1
                        }
                    }
                }
                
                if currentIndex == (cards.count - 1){
                    // Resetting Index to 0
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                        for index in cards.indices{
                            // Resetting ZIndex
                            cards[index].zIndex = 0
                        }
                        currentIndex = 0
                    }
                }
            }
        }else{
            offset = .zero
        }
    }
    
    func ZIndex(card: Card)->Double{
        let index = indexOf(card: card)
        let totalCount = cards.count
        
        return currentIndex > index ? Double(index - totalCount) : cards[index].zIndex
    }
    
    // MARK: Scale And Offset Values For Each Card
    // Adressing Negative Indexes
    func scaleFor(index value: Int)->Double{
        let index = Double(value - currentIndex)
        // MARK: I'm Only Showing Three Cards(Your Wish)
        if index >= 0{
            if index > 3{
                return 0.8
            }
            // For Each Card 0.06 Scale Will be Reduced
            return 1 - (index / 15)
        }else{
            if -index > 3{
                return 0.8
            }
            return 1 + (index / 15)
        }
    }
    
    func offsetFor(index value: Int)->Double{
        let index = Double(value - currentIndex)
        // MARK: I'm Only Showing Three Cards(Your Wish)
        if index >= 0{
            if index > 3{
                return 30
            }
            return (index * 10)
        }else{
            if -index > 3{
                return 30
            }
            return (-index * 10)
        }
    }
    
    func indexOf(card: Card)->Int{
        if let index = cards.firstIndex(where: { CCard in
            CCard.id == card.id
        }){
            return index
        }
        return 0
    }
}
