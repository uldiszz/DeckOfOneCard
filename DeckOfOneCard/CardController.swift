//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Uldis Zingis on 10/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    
    static func draw(numberOfCards: Int, completion: @escaping ((_ card: [Card]) -> Void)) {
        guard let url = self.baseURL else { fatalError("URL optional is nil") }
        let urlParameters = ["count": "\(numberOfCards)"]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            // Make sure there is data
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else {
                NSLog("No data returned from network request")
                completion([])
                return
            }
            
            // Turn the data into JSON
            // Parse through the dictionary to find where the dictionary version of your model objects are
            guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let cardsArray = responseDictionary["cards"] as? [[String: Any]] else {
                NSLog("Unable to serialize json. \nResponse: \(responseDataString)")
                return
            }
            
            // Turn the JSON into model object ([Card])
            let cardObjectArray = cardsArray.flatMap { Card(jsonDict: $0) }
            
            // Complete with the model objects
            completion(cardObjectArray)
        }
    }
}
