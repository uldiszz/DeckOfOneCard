//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Uldis Zingis on 10/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import Foundation

class Card {
    
    private let kImage = "image"
    private let kSuit = "suit"
    private let kValue = "value"
    
    let imageEndpoint: String
    let suit: String
    let value: String
    
    init(imageEndpoint: String, suit: String, value: String) {
        self.imageEndpoint = imageEndpoint
        self.suit = suit
        self.value = value
    }
    
    init?(jsonDict: [String: Any]) {
        guard let image = jsonDict[kImage] as? String,
            let suit = jsonDict[kSuit] as? String,
            let value = jsonDict[kValue] as? String else { return nil }
        
        self.imageEndpoint = image
        self.suit = suit
        self.value = value
    }
    
}
