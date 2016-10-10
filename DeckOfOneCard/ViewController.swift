//
//  ViewController.swift
//  DeckOfOneCard
//
//  Created by Uldis Zingis on 10/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBAction func cardButtonTapped(_ sender: AnyObject) {
        CardController.draw(numberOfCards: 1) { (cards) in
            guard let card = cards.first else { return }
            ImageController.image(forURL: card.imageEndpoint, completion: { (image) in
                guard let image = image else { return }
                self.cardImageView.image = image
            })
        }
    }
}
