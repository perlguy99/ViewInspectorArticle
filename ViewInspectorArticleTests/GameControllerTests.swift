//
//  GameControllerTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/2/24.
//
@testable import ViewInspectorArticle
import ViewInspector
import XCTest

final class GameControllerTests: XCTestCase {
    
    func testCreation() throws {
        XCTAssertNoThrow(GameController())
    }
    
    func testStartsWithTurnX() {
        let sut = GameController()
        XCTAssertEqual(sut.turn, .x)
    }
    
    func testToggleturnWorks() {
        let sut = GameController()
        XCTAssertEqual(sut.turn, .x)
        sut.toggleTurn()
        
        XCTAssertEqual(sut.turn, .o)
        sut.toggleTurn()
        XCTAssertEqual(sut.turn, .x)
        sut.toggleTurn()
        XCTAssertEqual(sut.turn, .o)
    }
    
    func testResetGame() {
        let sut = GameController()
        
        XCTAssertEqual(sut.turn, .x)
        sut.toggleTurn()
        XCTAssertEqual(sut.turn, .o)
        
        sut.resetGame()
        XCTAssertEqual(sut.turn, .x)
    }
    
    func testThatGameHasExactlyNineSquares() {
        let sut = Game()
        XCTAssertEqual(sut.squares.count, 9)
    }
    
    func testTakeTurn() {
        let sut = GameController()
        
        // Verify all are .empty
        XCTAssertEqual(sut.game.squares[0].value, .empty)
        XCTAssertEqual(sut.game.squares[1].value, .empty)
        XCTAssertEqual(sut.game.squares[2].value, .empty)
        XCTAssertEqual(sut.game.squares[3].value, .empty)
        XCTAssertEqual(sut.game.squares[4].value, .empty)
        XCTAssertEqual(sut.game.squares[5].value, .empty)
        XCTAssertEqual(sut.game.squares[6].value, .empty)
        XCTAssertEqual(sut.game.squares[7].value, .empty)
        XCTAssertEqual(sut.game.squares[8].value, .empty)
        
        // First lets see if we can't simple toggle each one.
        sut.takeTurn(index: 4)
        XCTAssertEqual(sut.game.squares[4].value, .x)
        
        sut.takeTurn(index: 5)
        XCTAssertEqual(sut.game.squares[5].value, .o)
    }
    
    func testTakeTurnCannotPickSameSquare() {
        let sut = GameController()
        
        // Verify empty
        XCTAssertEqual(sut.game.squares[4].value, .empty)
        
        // First lets see if we can't simple toggle each one.
        sut.takeTurn(index: 4)
        XCTAssertEqual(sut.game.squares[4].value, .x)
        
        sut.takeTurn(index: 4)
        XCTAssertEqual(sut.game.squares[4].value, .x)
    }
    
    func testTakeTurnUntilBoardFull() {
        let sut = GameController()
        
        // Test we can fill the board and keep track of turns
        sut.takeTurn(index: 0)
        XCTAssertEqual(sut.game.squares[0].value, .x)
        
        sut.takeTurn(index: 1)
        XCTAssertEqual(sut.game.squares[1].value, .o)
        
        sut.takeTurn(index: 2)
        XCTAssertEqual(sut.game.squares[2].value, .x)
        
        sut.takeTurn(index: 3)
        XCTAssertEqual(sut.game.squares[3].value, .o)
        
        sut.takeTurn(index: 4)
        XCTAssertEqual(sut.game.squares[4].value, .x)
        
        sut.takeTurn(index: 5)
        XCTAssertEqual(sut.game.squares[5].value, .o)
        
        sut.takeTurn(index: 6)
        XCTAssertEqual(sut.game.squares[6].value, .x)
        
        sut.takeTurn(index: 7)
        XCTAssertEqual(sut.game.squares[7].value, .o)
        
        sut.takeTurn(index: 8)
        XCTAssertEqual(sut.game.squares[8].value, .x)
    }
    
    // 3 in-a-row wins
    // 3 across, 1, 2, 3
    // 3 down, 1, 2, 3
    // 3 diagonally 1, 2
    let expected_x_wins = "X Won!"
    let expected_o_wins = "O Wins the Game!"
    let expected_draw = "It's a Draw!"
    
    
    func testBoardForWin_x_across_top() {
        let sut = GameController()
        
        sut.game.squares[0].value = .x
        sut.game.squares[1].value = .x
        sut.game.squares[2].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
    }
    
    func testBoardForWin_o_across_top() {
        let sut = GameController()
        
        sut.game.squares[0].value = .o
        sut.game.squares[1].value = .o
        sut.game.squares[2].value = .o
        
        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
    }
    
    func testBoardForWin_x_across_middle() {
        let sut = GameController()
        
        sut.game.squares[3].value = .x
        sut.game.squares[4].value = .x
        sut.game.squares[5].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
    }
    
    func testBoardForWin_o_across_middle() {
        let sut = GameController()
        
        sut.game.squares[3].value = .o
        sut.game.squares[4].value = .o
        sut.game.squares[5].value = .o
        
        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
    }
    
    func testBoardForWin_x_across_bottom() {
        let sut = GameController()
        
        sut.game.squares[6].value = .x
        sut.game.squares[7].value = .x
        sut.game.squares[8].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
    }
    
    func testBoardForWin_o_across_bottom() {
        let sut = GameController()
        
        sut.game.squares[6].value = .o
        sut.game.squares[7].value = .o
        sut.game.squares[8].value = .o
        
        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
    }
    
    func testBoardForWin_x_column_1() {
        let sut = GameController()
        
        sut.game.squares[0].value = .x
        sut.game.squares[3].value = .x
        sut.game.squares[6].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
    }
    
    func testBoardForWin_o_column_1() {
        let sut = GameController()
        
        sut.game.squares[0].value = .o
        sut.game.squares[3].value = .o
        sut.game.squares[6].value = .o
        
        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
    }
    
    func testBoardForWin_x_column_2() {
        let sut = GameController()
        
        sut.game.squares[1].value = .x
        sut.game.squares[4].value = .x
        sut.game.squares[7].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
    }
    
    func testBoardForWin_o_column_2() {
        let sut = GameController()
        
        sut.game.squares[1].value = .o
        sut.game.squares[4].value = .o
        sut.game.squares[7].value = .o
        
        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
    }
    
    func testBoardForWin_x_column_3() {
        let sut = GameController()
        
        sut.game.squares[2].value = .x
        sut.game.squares[5].value = .x
        sut.game.squares[8].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
    }
    
    func testBoardForWin_o_column_3() {
        let sut = GameController()
        
        sut.game.squares[2].value = .o
        sut.game.squares[5].value = .o
        sut.game.squares[8].value = .o
        
        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
    }
    func testBoardForWin_x_across_diagonal1() {
        let sut = GameController()
        
        sut.game.squares[0].value = .x
        sut.game.squares[4].value = .x
        sut.game.squares[8].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
    }
    
    func testBoardForWin_o_across_diagonal1() {
        let sut = GameController()
        
        sut.game.squares[0].value = .o
        sut.game.squares[4].value = .o
        sut.game.squares[8].value = .o
        
        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
    }

    func testBoardForWin_x_across_diagonal2() {
        let sut = GameController()
        
        sut.game.squares[2].value = .x
        sut.game.squares[4].value = .x
        sut.game.squares[6].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_x_wins)
    }

    func testBoardForWin_o_across_diagonal2() {
        let sut = GameController()
        
        sut.game.squares[2].value = .o
        sut.game.squares[4].value = .o
        sut.game.squares[6].value = .o
        
        XCTAssertEqual(sut.checkForWin(), expected_o_wins)
    }

    func testBoardForDraw() {
        let sut = GameController()
        
        sut.game.squares[0].value = .x
        sut.game.squares[1].value = .x
        sut.game.squares[2].value = .o
        sut.game.squares[3].value = .o
        sut.game.squares[4].value = .o
        sut.game.squares[5].value = .x
        sut.game.squares[6].value = .x
        sut.game.squares[7].value = .o
        sut.game.squares[8].value = .x
        
        XCTAssertEqual(sut.checkForWin(), expected_draw)
    }
}
