//
//  TTTBoardTests.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 8/6/24.
//

@testable import ViewInspectorArticle
import XCTest

final class TTTBoardTests: XCTestCase {
    
    func test_tttSquareCreation() throws {
        XCTAssertNoThrow(TTTBoard())
    }
    
}
