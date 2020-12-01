//
//  Card.swift
//  CardWorkout
//
//  Created by Michael Haviv on 11/30/20.
//

import UIKit

struct Card {
    
    static var allValues: [String?] {
        return getAllCards()
    }
    
    static func getAllCards() -> [String?] {
        let cardSymbols = ["C", "D", "H", "S"]
        var deck = [String?]()
        cardSymbols.forEach { symbol in
            for value in 2...14 {
                if value == 11 {
                    deck.append("J\(symbol)")
                } else if value == 12 {
                    deck.append("Q\(symbol)")
                } else if value == 13 {
                    deck.append("K\(symbol)")
                } else if value == 14 {
                    deck.append("A\(symbol)")
                } else {
                    deck.append("\(value)\(symbol)")
                }
            }
        }
        return deck
    }
}
