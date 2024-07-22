@testable import ViewInspectorArticle
import XCTest

// TTTSquare Business Rules
// - Contains a value that can be
//     .empty, .x, or .o
// - Default should be .empty


final class TTTSquareTests: XCTestCase {
    func test_tttSquareCreation() throws {
        XCTAssertNoThrow(TTTSquare())
    }
    
    func test_tttSquarePossibleValues() throws {
        let sut = TTTSquare()
        XCTAssertEqual(sut.value, TTTSquareValue.empty)
    }
}
