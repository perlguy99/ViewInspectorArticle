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
        
        // 3 in-a-row horizontally
        if game.squares[0].value == .x && game.squares[1].value == .x && game.squares[2].value == .x {
            return x_wins
        }

        if game.squares[0].value == .o && game.squares[1].value == .o && game.squares[2].value == .o {
            return o_wins
        }

        if game.squares[3].value == .x && game.squares[4].value == .x && game.squares[5].value == .x {
            return x_wins
        }

        if game.squares[3].value == .o && game.squares[4].value == .o && game.squares[5].value == .o {
            return o_wins
        }

        if game.squares[6].value == .x && game.squares[7].value == .x && game.squares[8].value == .x {
            return x_wins
        }

        if game.squares[6].value == .o && game.squares[7].value == .o && game.squares[8].value == .o {
            return o_wins
        }
        
        // 3 in-a-row vertically
        if game.squares[0].value == .x && game.squares[3].value == .x && game.squares[6].value == .x {
            return x_wins
        }

        if game.squares[0].value == .o && game.squares[3].value == .o && game.squares[6].value == .o {
            return o_wins
        }

        if game.squares[1].value == .x && game.squares[4].value == .x && game.squares[7].value == .x {
            return x_wins
        }

        if game.squares[1].value == .o && game.squares[4].value == .o && game.squares[7].value == .o {
            return o_wins
        }

        if game.squares[2].value == .x && game.squares[5].value == .x && game.squares[8].value == .x {
            return x_wins
        }

        if game.squares[2].value == .o && game.squares[5].value == .o && game.squares[8].value == .o {
            return o_wins
        }
        
        // 3 in-a-row diagonally
        if game.squares[0].value == .x && game.squares[4].value == .x && game.squares[8].value == .x {
            return x_wins
        }

        if game.squares[0].value == .o && game.squares[4].value == .o && game.squares[8].value == .o {
            return o_wins
        }

        if game.squares[2].value == .x && game.squares[4].value == .x && game.squares[6].value == .x {
            return x_wins
        }

        if game.squares[2].value == .o && game.squares[4].value == .o && game.squares[6].value == .o {
            return o_wins
        }

        // if ALL are filled and still no winner, then it is a draw!
        for square in game.squares {
            // are there any empties?
            if square.value == .empty {
                return nil
            } else {
                return draw
            }
        }
        
        return nil
    }
    
    
}
