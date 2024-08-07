//
//  TTTBoard.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/6/24.
//

import SwiftUI

class TTTBoard: ObservableObject {
    @Published var squares: [TTTSquare]
    @Published var currentTurn: GameTurn = .x
    @Published var isGameOver: Bool = false
    @Published var winner: TTTSquareState? = nil
    
    init() {
        squares = (0..<9).map { _ in TTTSquare() }
    }
    
    func reset() {
        squares = (0..<9).map { _ in TTTSquare() }
        currentTurn = .x
        isGameOver = false
        winner = nil
    }
    
    func toggleCurrentTurn() {
        currentTurn = currentTurn == .x ? .o : .x
    }
    
    func makeMove(at index: Int) {
        guard !isGameOver, squares[index].state == .empty else { return }
        
        // Set the state of the square to the turn
        // TTTSquareState      // GameTurn
        squares[index].state = currentTurn.toTTTSquareState()
        
        // Toggle who's turn it is
        currentTurn = currentTurn.toggle()
        
        checkForWinner()
    }
    
    func checkForWinner() {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
            [0, 4, 8], [2, 4, 6] // diagonals
        ]
        
        for pattern in winPatterns {
            let states = pattern.map { squares[$0].state }
            
            if states.allSatisfy({ $0 == .x }) {
                winner = .x
                isGameOver = true
                return
            } else if states.allSatisfy({ $0 == .o }) {
                winner = .o
                isGameOver = true
                return
            }
        }
        
        if squares.allSatisfy({ $0.state != .empty }) {
            isGameOver = true
        }
    }
    
    func printBoard() {
        let stringValues = squares.map { $0.state.stringValue }
        print("------------------------------")
        for row in 0..<3 {
            let startIndex = row * 3
            let endIndex = startIndex + 3
            let rowValues = stringValues[startIndex..<endIndex]
            print(rowValues.joined(separator: " "))
        }
        print("------------------------------\n\n")
    }
}
