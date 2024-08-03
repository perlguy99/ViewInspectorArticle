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
    

    
}
