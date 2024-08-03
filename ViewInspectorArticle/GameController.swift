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
    var game: Game = Game()
    
    var turn: TTT_Turn = .x

    func toggleTurn() {
        turn = (turn == .x ? .o : .x)
    }
    
    func resetGame() {
        turn = .x
    }
    
    func newGame() {
        
    }
    
    func foo() {
        print(game.squares[0].value)
    }
    
    
    func toggleSquare(index: Int) {
        guard index >= 0 && index <= 8 else {
            print("Index out of range!")
            return
        }
        
        game.squares[index].toggle()
    }
    
    func takeTurn(index: Int) {
        guard index >= 0 && index <= 8 else {
            print("Index out of range!")
            return
        }
        
        // Verify square has not been tapped yet
        if game.squares[index].value == .empty {
            // Check to see who's turn it is
            switch turn {
            case .x:
                game.squares[index].value = .x
            case .o:
                game.squares[index].value = .o
            }
            
            toggleTurn()
        }
    }
    
    func checkForWin() -> String? {
        let x_wins = "X Won!"
        let o_wins = "O Wins the Game!"
        let draw = "It's a Draw!"
        
        let winningCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
            [0, 4, 8], [2, 4, 6]             // Diagonal
        ]
        
        // Check for a winner
        for combination in winningCombinations {
            let (a, b, c) = (combination[0], combination[1], combination[2])
            if game.squares[a].value == .x && game.squares[b].value == .x && game.squares[c].value == .x {
                return x_wins
            }
            if game.squares[a].value == .o && game.squares[b].value == .o && game.squares[c].value == .o {
                return o_wins
            }
        }
        
        // Check for a draw
        if game.squares.allSatisfy({ $0.value != .empty }) {
            return draw
        }
        
        return nil
    }

    
    
}
