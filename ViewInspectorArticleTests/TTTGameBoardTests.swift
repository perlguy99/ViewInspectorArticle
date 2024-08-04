//
//  TTTGameBoardTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/2/24.
//

@testable import ViewInspectorArticle
import ViewInspector
import XCTest

final class TTTGameBoardTests: XCTestCase {
    
    func testThatGameBoardHas9Squares() {
        let sut = TTTGameBoardView()
        XCTAssertEqual(try sut.inspect().findAll(TTTSquareView.self).count, 9)
    }

    func testInitialBoardState() throws {
        var sut = TTTGameBoardView()
        let exp = sut.on(\.viewInspectorHook) { view in
            let squares = try view.actualView().gameController.squares
            XCTAssertEqual(squares.count, 9)
            XCTAssertTrue(squares.allSatisfy { $0.value == .empty })
        }
                          
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }

    func testTakeTurn() throws {
        var sut = TTTGameBoardView()
        let exp = sut.on(\.viewInspectorHook) { view in
            let gameController = try view.actualView().gameController
            
            gameController.takeTurn(index: 0)
            XCTAssertEqual(gameController.squares[0].value, .x)

            gameController.takeTurn(index: 1)
            XCTAssertEqual(gameController.squares[1].value, .o)
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }

    func testWinCondition() throws {
        var sut = TTTGameBoardView()
        let exp = sut.on(\.viewInspectorHook) { view in
            let gameController = try view.actualView().gameController
            
            gameController.takeTurn(index: 0)
            gameController.takeTurn(index: 3)
            gameController.takeTurn(index: 1)
            gameController.takeTurn(index: 4)
            gameController.takeTurn(index: 2)
            
            XCTAssertEqual(gameController.winnerMessage, "X Won!")
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }
    
}
