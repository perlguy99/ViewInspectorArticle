// TTTSquare Business Rules
// - Contains a value that can be
//     .empty, .x, or .o
// - Default should be .empty

@testable import ViewInspectorArticle
import XCTest

final class TTTSquareTests: XCTestCase {
    func test_tttSquareCreation() throws {
        XCTAssertNoThrow(TTTSquare())
    }
    
    func testTTTSquare_InitialState() throws {
        let square = TTTSquare()
        XCTAssertEqual(square.value, TTTSquareState.empty)
    }
    
    func testTTTSquare_Empty_State() throws {
        let square = TTTSquare(value: .empty)
        XCTAssertEqual(square.value, TTTSquareState.empty)
    }

    func testTTTSquare_Empty_StateByString() throws {
        let square = TTTSquare(value: .empty)
        XCTAssertEqual(square.stringValue, ".")
    }

    func testTTTSquare_O_State() throws {
        let square = TTTSquare(value: .o)
        XCTAssertEqual(square.value, TTTSquareState.o)
    }
    
    func testTTTSquare_X_State() throws {
        let square = TTTSquare(value: .x)
        XCTAssertEqual(square.value, TTTSquareState.x)
    }
    
    func testTTTSquare_Toggle() throws {
        let square = TTTSquare()
        XCTAssertEqual(square.value, TTTSquareState.empty)
        
        square.toggle()
        XCTAssertEqual(square.value, TTTSquareState.x)

        square.toggle()
        XCTAssertEqual(square.value, TTTSquareState.o)

        square.toggle()
        XCTAssertEqual(square.value, TTTSquareState.x)
        
        square.toggle()
        XCTAssertEqual(square.value, TTTSquareState.o)
    }
}
