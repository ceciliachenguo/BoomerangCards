//
//  HomeView.swift
//  BoomerangCards
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI

struct Home: View {
    // MARK: Sample Cards
    @State var cards: [Card] = []

    var body: some View {
        VStack {
            Text("🌈 Cards Effects 🌈")
                .foregroundColor(.white)
                .font(.title)
                .bold()
            Spacer()
            BoomerangCard(cards: $cards)
                .frame(height: 220)
                .padding(.horizontal,15)
        }
        .padding(.vertical)
        .preferredColorScheme(.dark)
        .onAppear(perform: setupCards)
    }
    
    // MARK: Setting Up Card's
    func setupCards(){
        cards = mockData
        
        // FOR INFINITE CARDS
        // Logic Is Simple, Place the First Card at Last
        // When the Last Card is Arrived, Set Index to 0
        if var first = cards.first{
            first.id = UUID().uuidString
            cards.append(first)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
