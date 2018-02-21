//
//  ViewController.swift
//  CardDraw
//
//  Created by Robert Lorentz on 2018-02-20.
//  Copyright © 2018 Robert Lorentz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cards = [String]()
    var currentCard = String()
    
    @IBOutlet weak var totalCards: UILabel!
    @IBOutlet weak var card: UIButton!
    @IBAction func cardPressed(_ sender: UIButton) {
        nextCard()
    }
    @IBAction func resetPressed(_ sender: UIButton) {
        loadCards()
        nextCard()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCards()
        nextCard()
    }
    
    func loadCards() {
        let fm = FileManager.default
        if let cards = try? fm.contentsOfDirectory(atPath: Bundle.main.resourcePath! + "/cards") {
            self.cards = cards
        }
    }
    
    func nextCard(){
        if (cards.count == 1) {
            //Do nothing
        } else {
            let r = Int(arc4random_uniform(UInt32(cards.count)))
            currentCard = cards[r]
            let cardImage = UIImage.init(named: currentCard)
            card.setImage(cardImage, for: .normal)
            cards.remove(at: r)
            totalCards.text = String(cards.count)
        }
    }
    
}

