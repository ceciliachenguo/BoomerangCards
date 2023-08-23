//
//  Card.swift
//  BoomerangCards
//
//  Created by Cecilia Chen on 8/22/23.
//

import Foundation

// MARK: Card Model
struct Card: Identifiable{
    var id: String = UUID().uuidString
    
    var imageName: String
    var title: String = ""
    var userAvatars: [String] = []
    var location: String = ""
    var fees: String = ""
    
    var isRotated: Bool = false
    var extraOffset: CGFloat = 0
    var scale: CGFloat = 1
    var zIndex: Double = 0
}

let mockData: [Card] = [
    Card(
        imageName: "sampleImage1",
        title: "Breathtaking\nMountain Adventure",
        userAvatars: ["https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/12244376/pexels-photo-12244376.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/1883385/pexels-photo-1883385.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/4323330/pexels-photo-4323330.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/4040907/pexels-photo-4040907.jpeg?auto=compress&cs=tinysrgb&w=800"],
        location: "Himalayas, Nepal",
        fees: "$30-$500"
    ),
    Card(
        imageName: "sampleImage2",
        title: "Tropical Beach\nGetaway Trip",
        userAvatars: ["https://images.pexels.com/photos/1462980/pexels-photo-1462980.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/2773977/pexels-photo-2773977.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/3265546/pexels-photo-3265546.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/5081971/pexels-photo-5081971.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/4974360/pexels-photo-4974360.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/4783536/pexels-photo-4783536.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/3851312/pexels-photo-3851312.jpeg?auto=compress&cs=tinysrgb&w=800"],
        location: "Maldives",
        fees: "$1200"
    ),
    Card(
        imageName: "sampleImage3",
        title: "Enchanting Paris\nCity Break",
        userAvatars: ["https://images.pexels.com/photos/2027821/pexels-photo-2027821.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/3764119/pexels-photo-3764119.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/2589650/pexels-photo-2589650.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/4906334/pexels-photo-4906334.jpeg?auto=compress&cs=tinysrgb&w=800"],
        location: "Paris, France",
        fees: "$400-$700"
    ),
    Card(
        imageName: "sampleImage4",
        title: "Exhilarating Desert\nSafari Experience",
        userAvatars: ["https://images.pexels.com/photos/1031081/pexels-photo-1031081.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/2080383/pexels-photo-2080383.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/4429279/pexels-photo-4429279.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/4040906/pexels-photo-4040906.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/3851294/pexels-photo-3851294.jpeg?auto=compress&cs=tinysrgb&w=800"],
        location: "Sahara, Africa",
        fees: "$350"
    ),
    Card(
        imageName: "sampleImage5",
        title: "Mysterious Amazon\nRainforest Trip",
        userAvatars: ["https://images.pexels.com/photos/1648377/pexels-photo-1648377.jpeg?auto=compress&cs=tinysrgb&w=800", "https://images.pexels.com/photos/2869318/pexels-photo-2869318.jpeg?auto=compress&cs=tinysrgb&w=800"],
        location: "Amazon, Brazil",
        fees: "$800"
    )
]
