//
//  GameController.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/2/24.
//

import Foundation

enum TTT_Turn {
    case x, o
    
    var stringValue: String {
        switch self {
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
}

class GameController {
//    TTTSquare
    
    var turn: TTT_Turn = .x
    
    func newGame() -> () {
        
    }
    
}
