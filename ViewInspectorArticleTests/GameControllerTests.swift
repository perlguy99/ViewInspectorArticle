//
//  GameControllerTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/2/24.
//
@testable import ViewInspectorArticle
import ViewInspector
import XCTest

//final class GameControllerTests: XCTestCase {
//    
//    func testCreation() throws {
//        XCTAssertNoThrow(GameController())
//    }
//    
//    func testStartsWithTurnX() {
//        let sut = GameController()
//        XCTAssertEqual(sut.turn, .x)
//    }
//    
//    func testToggleturnWorks() {
//        let sut = GameController()
//        XCTAssertEqual(sut.turn, .x)
//        sut.toggleTurn()
//        
//        XCTAssertEqual(sut.turn, .o)
//        sut.toggleTurn()
//        XCTAssertEqual(sut.turn, .x)
//        sut.toggleTurn()
//        XCTAssertEqual(sut.turn, .o)
//    }
//    
//    func testResetGame() {
//        let sut = GameController()
//        
//        XCTAssertEqual(sut.turn, .x)
//        sut.toggleTurn()
//        XCTAssertEqual(sut.turn, .o)
//        
//        sut.resetGame()
//        XCTAssertEqual(sut.turn, .x)
//    }
//    
//    func testThatGameHasExactlyNineSquares() {
//        let sut = GameController()
//        XCTAssertEqual(sut.squares.count, 9)
//    }
//    
//    func testTakeTurn() {
//        let sut = GameController()
//        
//        // Verify all are .empty
//        XCTAssertEqual(sut.squares[0].state, .empty)
//        XCTAssertEqual(sut.squares[1].state, .empty)
//        XCTAssertEqual(sut.squares[2].state, .empty)
//        XCTAssertEqual(sut.squares[3].state, .empty)
//        XCTAssertEqual(sut.squares[4].state, .empty)
//        XCTAssertEqual(sut.squares[5].state, .empty)
//        XCTAssertEqual(sut.squares[6].state, .empty)
//        XCTAssertEqual(sut.squares[7].state, .empty)
//        XCTAssertEqual(sut.squares[8].state, .empty)
//        
//        // First lets see if we can't simple toggle each one.
//        sut.takeTurn(index: 4)
//        XCTAssertEqual(sut.squares[4].state, .x)
//        
//        sut.takeTurn(index: 5)
//        XCTAssertEqual(sut.squares[5].state, .o)
//    }
//    
//    func testTakeTurnCannotPickSameSquare() {
//        let sut = GameController()
//        
//        // Verify empty
//        XCTAssertEqual(sut.squares[4].state, .empty)
//        
//        // First lets see if we can't simple toggle each one.
//        sut.takeTurn(index: 4)
//        XCTAssertEqual(sut.squares[4].state, .x)
//        
//        sut.takeTurn(index: 4)
//        XCTAssertEqual(sut.squares[4].state, .x)
//    }
//    
//    func testTakeTurnUntilBoardFull() {
//        let sut = GameController()
//        sut.resetGame()
//        
//        // Test we can fill the board and keep track of turns
//        sut.takeTurn(index: 0)
//        XCTAssertEqual(sut.squares[0].state, .x)
//        
//        sut.takeTurn(index: 1)
//        XCTAssertEqual(sut.squares[1].state, .o)
//        
//        sut.takeTurn(index: 2)
//        XCTAssertEqual(sut.squares[2].state, .x)
//        
//        sut.takeTurn(index: 3)
//        XCTAssertEqual(sut.squares[3].state, .o)
//        
//        sut.takeTurn(index: 4)
//        XCTAssertEqual(sut.squares[4].state, .x)
//        
//        sut.takeTurn(index: 5)
//        XCTAssertEqual(sut.squares[5].state, .o)
//        
//        sut.takeTurn(index: 6)
//        XCTAssertEqual(sut.squares[6].state, .x)
//        
//        sut.takeTurn(index: 7)
//        XCTAssertEqual(sut.squares[7].state, .o)
//        
//        sut.takeTurn(index: 8)
//        XCTAssertEqual(sut.squares[8].state, .x)
//    }
//    
//    // 3 in-a-row wins
//    // 3 across, 1, 2, 3
//    // 3 down, 1, 2, 3
//    // 3 diagonally 1, 2
//    let expected_x_wins = "X Won!"
//    let expected_o_wins = "O Wins the Game!"
//    let expected_draw = "It's a Draw!"
//    
//    
//    func testBoardForWin_x_across_top() {
//        let sut = GameController()
//        
//        sut.squares[0].state = .x
//        sut.squares[1].state = .x
//        sut.squares[2].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
//    }
//    
//    func testBoardForWin_o_across_top() {
//        let sut = GameController()
//        
//        sut.squares[0].state = .o
//        sut.squares[1].state = .o
//        sut.squares[2].state = .o
//        
//        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
//    }
//    
//    func testBoardForWin_x_across_middle() {
//        let sut = GameController()
//        
//        sut.squares[3].state = .x
//        sut.squares[4].state = .x
//        sut.squares[5].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
//    }
//    
//    func testBoardForWin_o_across_middle() {
//        let sut = GameController()
//        
//        sut.squares[3].state = .o
//        sut.squares[4].state = .o
//        sut.squares[5].state = .o
//        
//        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
//    }
//    
//    func testBoardForWin_x_across_bottom() {
//        let sut = GameController()
//        
//        sut.squares[6].state = .x
//        sut.squares[7].state = .x
//        sut.squares[8].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
//    }
//    
//    func testBoardForWin_o_across_bottom() {
//        let sut = GameController()
//        
//        sut.squares[6].state = .o
//        sut.squares[7].state = .o
//        sut.squares[8].state = .o
//        
//        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
//    }
//    
//    func testBoardForWin_x_column_1() {
//        let sut = GameController()
//        
//        sut.squares[0].state = .x
//        sut.squares[3].state = .x
//        sut.squares[6].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
//    }
//    
//    func testBoardForWin_o_column_1() {
//        let sut = GameController()
//        
//        sut.squares[0].state = .o
//        sut.squares[3].state = .o
//        sut.squares[6].state = .o
//        
//        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
//    }
//    
//    func testBoardForWin_x_column_2() {
//        let sut = GameController()
//        
//        sut.squares[1].state = .x
//        sut.squares[4].state = .x
//        sut.squares[7].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
//    }
//    
//    func testBoardForWin_o_column_2() {
//        let sut = GameController()
//        
//        sut.squares[1].state = .o
//        sut.squares[4].state = .o
//        sut.squares[7].state = .o
//        
//        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
//    }
//    
//    func testBoardForWin_x_column_3() {
//        let sut = GameController()
//        
//        sut.squares[2].state = .x
//        sut.squares[5].state = .x
//        sut.squares[8].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
//    }
//    
//    func testBoardForWin_o_column_3() {
//        let sut = GameController()
//        
//        sut.squares[2].state = .o
//        sut.squares[5].state = .o
//        sut.squares[8].state = .o
//        
//        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
//    }
//    func testBoardForWin_x_across_diagonal1() {
//        let sut = GameController()
//        
//        sut.squares[0].state = .x
//        sut.squares[4].state = .x
//        sut.squares[8].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
//    }
//    
//    func testBoardForWin_o_across_diagonal1() {
//        let sut = GameController()
//        
//        sut.squares[0].state = .o
//        sut.squares[4].state = .o
//        sut.squares[8].state = .o
//        
//        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
//    }
//
//    func testBoardForWin_x_across_diagonal2() {
//        let sut = GameController()
//        
//        sut.squares[2].state = .x
//        sut.squares[4].state = .x
//        sut.squares[6].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
//    }
//
//    func testBoardForWin_o_across_diagonal2() {
//        let sut = GameController()
//        
//        sut.squares[2].state = .o
//        sut.squares[4].state = .o
//        sut.squares[6].state = .o
//        
//        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
//    }
//
//    func testBoardForDraw() {
//        let sut = GameController()
//        
//        sut.squares[0].state = .x
//        sut.squares[1].state = .x
//        sut.squares[2].state = .o
//        sut.squares[3].state = .o
//        sut.squares[4].state = .o
//        sut.squares[5].state = .x
//        sut.squares[6].state = .x
//        sut.squares[7].state = .o
//        sut.squares[8].state = .x
//        
//        XCTAssertEqual(sut.checkForWin(), expected_draw)
//    }
//}
