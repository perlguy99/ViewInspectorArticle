//
//  TTTBoardTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/6/24.
//

@testable import ViewInspectorArticle
import XCTest

final class TTTBoardTests: XCTestCase {
    
    func testBoardInitialization() throws {
        let board = TTTBoard()
        XCTAssertEqual(board.squares.count, 9)
        XCTAssertEqual(board.currentTurn, .x)
        XCTAssertFalse(board.isGameOver)
        XCTAssertNil(board.winner)
    }
    
    func testMakeMove() throws {
        let board = TTTBoard()
        board.makeMove(at: 0)
        
        XCTAssertEqual(board.squares[0].state, .x)
        XCTAssertEqual(board.currentTurn, .o)
    }
    
    func testWinningCondition_X() throws {
        let board = TTTBoard()
        board.makeMove(at: 0) // X
        board.makeMove(at: 3) // O
        board.makeMove(at: 1) // X
        board.makeMove(at: 4) // O
        board.makeMove(at: 2) // X

        XCTAssertTrue(board.isGameOver)
        XCTAssertEqual(board.winner, .x)
        
        print("\n\nWinning Board X:")
        board.printBoard()
    }
    
    func testWinningCondition_O() throws {
        let board = TTTBoard()
        // o | o | o
        // x | x | .
        // x | . | .
        board.makeMove(at: 3) // X
        board.makeMove(at: 0) // O
        board.makeMove(at: 4) // X
        board.makeMove(at: 1) // O
        board.makeMove(at: 6) // X
        board.makeMove(at: 2) // O
        
        XCTAssertTrue(board.isGameOver)
        XCTAssertEqual(board.winner, .o)
        
        print("\n\nWinning Board O:")
        board.printBoard()
    }
    
    func testDrawCondition() throws {
        let board = TTTBoard()
        let moves: [(Int, TTTSquareState)] = [
            (0, .x), (1, .o), (2, .x),
            (3, .x), (4, .o), (5, .x),
            (6, .o), (7, .x), (8, .o)
        ]
        
        for (index, state) in moves {
            board.squares[index].state = state
        }
        
        print("\n\nDraw!")
        board.printBoard()
        
        board.checkForWinner()
        
        XCTAssertTrue(board.isGameOver)
        XCTAssertNil(board.winner)
    }
    
    func testReset() throws {
        let board = TTTBoard()
        let moves: [(Int, TTTSquareState)] = [
            (0, .x), (1, .o), (2, .x),
            (3, .x), (4, .o), (5, .x),
            (6, .o), (7, .x), (8, .o)
        ]
        
        for (index, state) in moves {
            board.squares[index].state = state
        }
        
        print("\n\nDraw!")
        board.printBoard()
        
        board.checkForWinner()

        XCTAssertTrue(board.isGameOver)
        XCTAssertFalse(board.squares.allSatisfy { $0.state == .empty })
        
        board.reset()

        XCTAssertFalse(board.isGameOver)
        XCTAssertTrue(board.squares.allSatisfy { $0.state == .empty })
        
    }
}
