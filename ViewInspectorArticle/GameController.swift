//
//  GameController.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/2/24.
//

import SwiftUI

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

//@StateObject var square = TTTSquare()

// Each SquareView item has a TTTSquare() as part of it.

struct Game {
    var squares = [
        TTTSquare(), TTTSquare(), TTTSquare(),
        TTTSquare(), TTTSquare(), TTTSquare(),
        TTTSquare(), TTTSquare(), TTTSquare()
    ]
}


// A "Game" should have 9 TTTSquareView objects


@Observable
class GameController {
    var turn: TTT_Turn = .x
    
//    var newGame = Game()
//    
//    var gameSquares = [
//        TTTSquare(), TTTSquare(), TTTSquare(),
//        TTTSquare(), TTTSquare(), TTTSquare(),
//        TTTSquare(), TTTSquare(), TTTSquare()
//    ]
    
    
//    var game = [
//        TTTSquareView(viewId: 0, square: gameSquares[0]), TTTSquareView(viewId: 1, square: <#TTTSquare#>), TTTSquareView(viewId: 2, square: <#TTTSquare#>),
//        TTTSquareView(viewId: 3, square: <#TTTSquare#>), TTTSquareView(viewId: 4, square: <#TTTSquare#>), TTTSquareView(viewId: 5, square: <#TTTSquare#>),
//        TTTSquareView(viewId: 6, square: <#TTTSquare#>), TTTSquareView(viewId: 7, square: <#TTTSquare#>), TTTSquareView(viewId: 8, square: <#TTTSquare#>)
//    ]
    
}
