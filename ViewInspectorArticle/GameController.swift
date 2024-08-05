//
//  GameController.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/2/24.
//

import SwiftUI

//enum TTT_Turn {
//    case x, o
//    
//    var stringValue: String {
//        switch self {
//        case .x:
//            return "X"
//        case .o:
//            return "O"
//        }
//    }
//}

//@StateObject var square = TTTSquare()

// Each SquareView item has a TTTSquare() as part of it.

// A "Game" should have 9 TTTSquareView objects
//class GameController: ObservableObject {
//    @Published var turn: TTT_Turn = .x
//    @Published var winnerMessage: String?
//    @Published var squares = [
//        TTTSquare(), TTTSquare(), TTTSquare(),
//        TTTSquare(), TTTSquare(), TTTSquare(),
//        TTTSquare(), TTTSquare(), TTTSquare()
//    ]
//
//    func toggleTurn() {
//        turn = (turn == .x ? .o : .x)
//    }
//    
//    func resetGame() {
//        resetSquares()
//        turn = .x
//        winnerMessage = nil
//    }
//    
//    func resetSquares() {
//        squares = [
//            TTTSquare(), TTTSquare(), TTTSquare(),
//            TTTSquare(), TTTSquare(), TTTSquare(),
//            TTTSquare(), TTTSquare(), TTTSquare()
//        ]
//    }
//    
//    func takeTurn(index: Int) {
//        print("\n----------index: \(index)--------------------")
//        guard index >= 0 && index < 9 else { return }
//        print("\n----------index 2: \(index)--------------------\n")
//        
//        if squares[index].state == .empty {
//            squares[index].state = turn == .x ? .x : .o
//
//            toggleTurn()
//            
//            if let winner = checkForWin() {
//                winnerMessage = winner
//            }
//
//        }
//    }
//    
//    func checkForWin() -> String? {
//        let x_wins = "X Won!"
//        let o_wins = "O Wins the Game!"
//        let draw = "It's a Draw!"
//        
//        let winningCombinations = [
//            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
//            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
//            [0, 4, 8], [2, 4, 6]             // Diagonal
//        ]
//        
//        // Check for a winner
//        for combination in winningCombinations {
//            let (a, b, c) = (combination[0], combination[1], combination[2])
//            if squares[a].state == .x && squares[b].state == .x && squares[c].state == .x {
//                return x_wins
//            }
//            if squares[a].state == .o && squares[b].state == .o && squares[c].state == .o {
//                return o_wins
//            }
//        }
//        
//        // Check for a draw
//        if squares.allSatisfy({ $0.state != .empty }) {
//            return draw
//        }
//        
//        return nil
//    }
//
//    func asciiRepresentation() -> String {
//        var result = ""
//        for row in 0..<3 {
//            for col in 0..<3 {
//                let index = row * 3 + col
//                let value = squares[index].state
//                result += value == .empty ? "." : value == .x ? "X" : "O"
//                if col < 2 {
//                    result += " | "
//                }
//            }
//            if row < 2 {
//                result += "\n---------\n"
//            }
//        }
//        return result
//    }
//    
//    
//}
