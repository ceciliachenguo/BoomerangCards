//
//  SingleCardView.swift
//  BoomerangCards
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI

struct SingleCardView: View {
    let colors = [Color("color1"), Color("color2"), Color("color3"), Color("color4")]
    let singleCard: Card
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: colors),
                                     startPoint: .leading,
                                     endPoint: .trailing))
                .frame(height: 220)
            
            Rectangle()
                .fill(themeColor)
                .frame(height: 170)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            
            HStack {
                VStack(alignment: .leading) {
                    Text(singleCard.title)
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                    
                    HStack {
                        AvatarStackView(userAvatars: singleCard.userAvatars)

                        if singleCard.userAvatars.count > 3 {
                            Text("+\(singleCard.userAvatars.count - 3) applied")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.white)
                        }
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image("mapPinIcon")

                        Text(singleCard.location)
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                            HStack(spacing: 0) {
                                Text(singleCard.fees)
                                    .font(.system(size: 10))
                                    .foregroundColor(.black)
                                    .bold()
                                Text(" /trip")
                                    .font(.system(size: 10))
                                    .bold()
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(width: 100, height: 28)
                    }
                }
                .padding([.horizontal, .top])
                .padding(.bottom, 12)
                Spacer()
            }
        }
        .frame(height: 220)
    }
    
    func generateRandomBackground() -> Color {
        let cardColors = [Color("color1"), Color("color2"), Color("color3"), Color("color4"), Color("color5"), Color("color6")]
        if let winner = cardColors.randomElement() {
            return winner
        }
        return cardColors[0]
    }
}

extension SingleCardView {
    var themeColor:Color { generateRandomBackground() }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Single_Card_View_Previews: PreviewProvider {

    static var previews: some View {
        SingleCardView(singleCard: mockData[0])
    }
}
