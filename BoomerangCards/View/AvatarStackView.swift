//
//  AvatarStackView.swift
//  BoomerangCards
//
//  Created by Cecilia Chen on 8/22/23.
//

import SwiftUI

struct AvatarStackView: View {
    let userAvatars: [String]
    
    var body: some View {
        //MARK: - Profile Pic Stack
        HStack(spacing: -5){
            //MARK: first 3 profile pictures
            ForEach(0..<min(userAvatars.count, 3), id: \.self) { index in
                AsyncImage(url: URL(string: userAvatars[index])) { image in
                    image.resizable()
                        .avatarStackStyle()
                } placeholder: {
                    Circle()
                        .avatarStackStyle()
                }
            }
        }
    }
}
#Preview {
    AvatarStackView(userAvatars: mockData[0].userAvatars)
}

struct AvatarStackStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .clipShape(Circle())
            .frame(width:33, height: 33)
            .overlay(
                Circle()
                    .stroke(Color(.white), lineWidth: 2)
            )
    }
}
extension View {
    func avatarStackStyle() -> some View {
        self.modifier(AvatarStackStyleModifier())
    }
}
